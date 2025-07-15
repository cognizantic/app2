use std::mem::{size_of, zeroed};
use std::os::windows::ffi::OsStrExt;
use std::ffi::OsStr;

use windows::{
    core::*,
    Win32::Foundation::*,
    Win32::System::LibraryLoader::*,
    Win32::UI::WindowsAndMessaging::*,
    Win32::UI::Input::*,
};

const CLASS_NAME: &str = "RawInputExampleWindow";

unsafe extern "system" fn window_proc(
    hwnd: HWND,
    msg: u32,
    wparam: WPARAM,
    lparam: LPARAM,
) -> LRESULT {
    match msg {
        WM_INPUT => {
            let mut dw_size = 0u32;

            GetRawInputData(
                HRAWINPUT(lparam.0 as isize),
                RID_INPUT,
                None,
                &mut dw_size,
                size_of::<RAWINPUTHEADER>() as u32,
            );

            let mut raw_buf = vec![0u8; dw_size as usize];

            let res = GetRawInputData(
                HRAWINPUT(lparam.0 as isize),
                RID_INPUT,
                Some(raw_buf.as_mut_ptr() as *mut _),
                &mut dw_size,
                size_of::<RAWINPUTHEADER>() as u32,
            );

            if res == dw_size {
                let raw: &RAWINPUT = &*(raw_buf.as_ptr() as *const RAWINPUT);

                match raw.header.dwType {
                    1 => { // RIM_TYPEKEYBOARD = 1
                        let kb = unsafe { raw.data.keyboard };
                        println!(
                            "Keyboard: MakeCode={}, Flags={}, VKey={}, Msg={}",
                            kb.MakeCode, kb.Flags, kb.VKey, kb.Message
                        );
                    }
                    0 => { // RIM_TYPEMOUSE = 0
                        let mouse = unsafe { raw.data.mouse };
                        println!(
                            "Mouse: Flags={}, Buttons=0x{:X}, LastX={}, LastY={}",
                            mouse.usFlags,
                            unsafe { mouse.Anonymous.ulButtons },
                            mouse.lLastX,
                            mouse.lLastY
                        );
                    }
                    _ => {}
                }
            }

            LRESULT(0)
        }
        WM_DESTROY => {
            PostQuitMessage(0);
            LRESULT(0)
        }
        _ => DefWindowProcW(hwnd, msg, wparam, lparam),
    }
}

fn to_wide(s: &str) -> Vec<u16> {
    OsStr::new(s).encode_wide().chain(Some(0)).collect()
}

fn main() -> Result<()> {
    unsafe {
        let h_instance = GetModuleHandleW(None)?;

        let class_name = to_wide(CLASS_NAME);

        let wc = WNDCLASSW {
            hInstance: h_instance,
            lpszClassName: PCWSTR(class_name.as_ptr()),
            lpfnWndProc: Some(window_proc),
            ..zeroed()
        };

        RegisterClassW(&wc);

        let hwnd = CreateWindowExW(
            Default::default(),
            PCWSTR(class_name.as_ptr()),
            PCWSTR(to_wide("Raw Input Example").as_ptr()),
            WS_OVERLAPPEDWINDOW,
            CW_USEDEFAULT,
            CW_USEDEFAULT,
            800,
            600,
            HWND(0),
            HMENU(0),
            h_instance,
            Some(std::ptr::null_mut()),
        );

        ShowWindow(hwnd, SW_SHOW);
        UpdateWindow(hwnd);

        let devices = [
            RAWINPUTDEVICE {
                usUsagePage: 0x01,
                usUsage: 0x02, // Mouse
                dwFlags: RIDEV_INPUTSINK,
                hwndTarget: hwnd,
            },
            RAWINPUTDEVICE {
                usUsagePage: 0x01,
                usUsage: 0x06, // Keyboard
                dwFlags: RIDEV_INPUTSINK,
                hwndTarget: hwnd,
            },
        ];

        RegisterRawInputDevices(&devices, size_of::<RAWINPUTDEVICE>() as u32);

        let mut msg = zeroed::<MSG>();
        while GetMessageW(&mut msg, HWND(0), 0, 0).into() {
            TranslateMessage(&msg);
            DispatchMessageW(&msg);
        }
    }

    Ok(())
}
