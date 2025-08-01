import express from 'express';
import mysql from 'mysql2/promise';
import cors from 'cors';
import bcrypt from 'bcrypt';
import dayjs from 'dayjs';
import nodemailer from 'nodemailer';
import https from 'https'
//var http = require('http');
const PORT = 3443;
let IP_HOST;

https.get('https://api.ipify.org?format=json&ipAddressType=IPv4', function(resp) {
  resp.on('data', function(ip) {
    console.log("My public IP address is: " + ip);
    IP_HOST='0.0.0.0';
    app1.listen(PORT,IP_HOST,()=>{
    console.log(`express server started and running on http://${IP_HOST}:${PORT}/`);
});
  });
});


const app1=express();
app1.use(cors());
app1.use(express.json());
const db_connect=await mysql.createConnection({
    host:'localhost',
    user:'cognizantic',
    password:'sharan9595',
    database:'app1'

});

function date_(rawDob){
    const dob = dayjs(rawDob, ['DD-MM-YYYY', 'YYYY-MM-DD']).format('YYYY-MM-DD');
    return dob;
};

function sendmail1(email,code){
  console.log("TO:",email);
  console.log("MESSAGE:",code);
};

console.log('database connected');



app1.post('/sign-up',async(req,res)=>{
    
    const {username,firstname,lastname,dob,email,password,phonenumber,address,state,country}=req.body;
    var dob_=date_(dob);
    console.log(req.body);
   try{
        const [checker1]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE email = ?`, [email]);
        const [checker2]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE username = ?`, [username]);
        const [checker3]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE ph_no = ?`, [phonenumber]);
        console.log(checker1,checker2,checker3);
        if(checker1.length==0&&checker2.length==0&&checker3.length==0){
    const [result1] = await db_connect.execute(`INSERT INTO profile_(username, first_name,last_name,dob,email,ph_no,address,state,country) VALUES (?,?,?,?,?,?,?,?,?)`,[username,firstname,lastname,dob_,email,phonenumber,address,state,country]);
    const [userRow] = await db_connect.execute(`SELECT user_id FROM profile_ WHERE email = ?`, [email]);
    const userid = userRow[0].user_id;
    console.log(userid)
    const [result2]=await db_connect.execute(`UPDATE verification_ SET hash_pass = ? WHERE user_id = ?`,[password,userid]);
    console.log("new data added",result1,result2);
    res.status(200).json({
      message: 'Sign-up successful',
      user_id: userid,
    });}else{
        if(checker1.length!= 0 && checker2.length!= 0&& checker3.length!=0){
            console.log("username and email and phone found");
            res.status(300).json({
            message:'value present',
        })
        }
        else if(checker1.length!=0 ){
            console.log("email found");
            res.status(301).json({
            message:'value present',
        })} else if (checker2.length!=0){
            console.log("username found");
            res.status(302).json({
            message:'value present',
        })
        }
        else if(checker3.length!=0){
            console.log('phone found');
            res.status(303).json({message:'value present'})
        }else if(checker1.length!=0&& checker3.length!=0){
            console.log("username and phone found");
            res.status(304).json({
            message:'value present',
        })
        }else if(checker2.length!=0&& checker1.length!=0){
            console.log("email and phone found");
            res.status(305).json({
            message:'value present',
        })
        }else if(checker2.length!=0 && checker3.length!=0){
            console.log("username and email found");
            res.status(306).json({
            message:'value present',
        })
      };
    }    
   }catch(err){
    console.log(err);
    res.status(500).json({ error: 'Insert failed' });
   } 
});

app1.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    const [userRow] = await db_connect.execute(
      `SELECT user_id FROM profile_ WHERE username = ?`,
      [username]
    );
    if (!userRow || userRow.length === 0) {
      console.log('no username');
      return res.status(301).json({ message: 'no user found' });
    }
    const userid = userRow[0].user_id;
    const [userpass] = await db_connect.execute(
      `SELECT hash_pass FROM verification_ WHERE user_id = ?`,
      [userid]
    );
    if (!userpass || userpass.length === 0) {
      return res.status(302).json({ message: 'verification not set' });
    }
    if (password === userpass[0].hash_pass) {
      console.log('passed');
      return res.status(200).json({ message: userid });
    } else {
      console.log('failed');
      return res.status(300).json({ message: 'wrong password' });
    }
  } catch (e) {
    console.log(e);
    res.status(500).json({ error: 'check failed' });
  }
});

app1.post('/account-details',async(req,res)=>{

});

app1.post('/forgot-password',async(req,res)=>{
  try{
  const{username}=req.body;
  const [checker1]=await db_connect.execute(`SELECT p.email, v.change_token
   FROM profile_ p
   INNER JOIN verification_ v ON p.user_id = v.user_id
   WHERE p.username = ?`, [username]);
  sendmail1(checker1[0].email,checker1[0].change_token);
  return res.status(200).json({ message: checker1[0].user_id });
}catch(e){
  console.log(e);
  res.status(500).json({error:"error"});
}
});

app1.post('/verification',async(req,res)=>{
  try{
    const {username,code}=req.body;
    const [checker1]=await db_connect.execute(`SELECT v.change_token
   FROM profile_ p
   INNER JOIN verification_ v ON p.user_id = v.user_id
   WHERE p.username = ?`, [username]);
   if(code===checker1[0].change_token){
    console.log('passed');
    res.status(200).json({message:"correct"});
   }else{
    console.log('failed');
    res.status(300).json({message:"correct"});
   }
  }catch(e){console.log(e);res.status(500).json({error:"error"});}
})

app1.post('/send-password',async(req,res)=>{
  try{
    const{username}=req.body;
    const [checker1]=await db_connect.execute(`SELECT v.hash_pass , p.email
      FROM profile_ p
      INNER JOIN verification_ v ON p.user_id=v.user_id
      WHERE p.username=?`,[username]);
      if(checker1[0].hash_pass){
    console.log('passed');
    await sendmail1(checker1[0].email,checker1[0].hash_pass);
    res.status(200).json({message:"correct"});
   }else{
    console.log('failed');
    res.status(300).json({message:"correct"});
   }
  }catch(e){
    console.log(e);
    res.status(500).json({error:"error"});
  };
});

app1.post('/change-password',async(req,res)=>{
  try{
    const{username,password}=req.body;
    const [checker1]=await db_connect.execute(`UPDATE verification_ v
      INNER JOIN profile_ p ON p.user_id = v.user_id
      SET v.hash_pass = ?
      WHERE p.username = ?`,[password,username]);
    if (checker1.affectedRows > 0) {
      res.status(200).json({ message: "Password updated successfully" });
    } else {
      res.status(300).json({ error: "User not found" });
    }
  }catch(e){
    console.log(e);
    res.status(500).json({error:"error"});
  };
});

app1.post('/check-username',async(req,res)=>{
  try{
    const{username}=req.body;
    const [checker2]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE username = ?`, [username]);
        if(checker2.length!=0){
            console.log("username found");
            res.status(302).json({
            message:'value present',
        })
        }else{
          console.log('username not found continue');
          res.status(200).json({
            message:'value not present',
        });
        }
  }catch(e){
    console.log(e);
    res.status(500).json({
            message:'error',
        })
  }
})

app1.post('/check-email',async(req,res)=>{
  try{
    const{email}=req.body;
    const [checker1]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE email = ?`, [email]);
        if(checker1.length!=0){
            console.log("email found");
            res.status(301).json({
            message:'value present',
        })
        }else{
          console.log('email not found continue');
          res.status(200).json({
            message:'value not present',
        });
        }
  }catch(e){
    console.log(e);
  res.status(500).json({
            message:'error',
        })
  }
})

app1.post('/check-phone',async(req,res)=>{
  try{
    const{phonenumber}=req.body;
    const [checker3]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE ph_no = ?`, [phonenumber]);
        if(checker3.length!=0){
            console.log("phone found");
            return res.status(304).json({
            message:'value present',
        })
        }else{
          console.log('phone not found continue');
          return res.status(200).json({
            message:'value not present',
        });
        }
  }catch(e){
    console.log(e);
   return res.status(500).json({
            message:'error',
        })
  }
})

app1.post('/update-ip',async(req,res)=>{
  try{
  const{username,deviceName,deviceIP4,deviceIP6}=req.body;
  console.log(req.body);
  const [checker4]=await db_connect.execute(`SELECT username from devices_wifi where device_name=?`,[deviceName]);
  if(checker4.length!=0){
    if(checker4[0].username==username){
      const [checker2]=await db_connect.execute(`update devices_wifi set ip_addr_v4 =?, ip_addr_v6=?,status_update=?,last_update= CURRENT_TIMESTAMP   where username=? and device_name=?`,[deviceIP4,deviceIP6,true,username,deviceName]);
      console.log('ip value changed');
      return res.status(200).json({message:'changed value',});
    }else{
      console.log("hello");
    }
  }else{
      const [checker1]=await db_connect.execute(`select user_id from profile_ where username=?`,[username])
      if(checker1.length!=0){
      const [checker5]=await db_connect.execute(`insert into devices_wifi (user_id,username,device_name,ip_addr_v4,ip_addr_v6,status_update) values (?,?,?,?,?,?)`,[checker1[0].user_id,username,deviceName,deviceIP4,deviceIP6,true])
      console.log('ip value entered');
      return res.status(200).json({message:'changed value',});
  }
  }
  }catch(e){
    console.log(e);
    console.log('ip value not entered');
      return res.status(500).json({message:'not changed value',});
  }
})