import express from 'express';
import mysql from 'mysql2/promise';
import cors from 'cors';
import bcrypt from 'bcrypt';
import dayjs from 'dayjs';
import nodemailer from 'nodemailer';


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

console.log('database connected');
const PORT = 3443;
const IP_HOST='127.0.0.1';
app1.listen(PORT,IP_HOST,()=>{
    console.log(`express server started and running on http://${IP_HOST}:${PORT}/`);
});

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
        }
        
        ;

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
  const{username}=req.body;
  const [checker1]=await db_connect.execute(`SELECT user_id FROM profile_ WHERE username = ?`, [username]);
  const userid=checker1[0].user_id;
  const [valuegetter]=await db_connect.execute(`SELECT change_token FROM verification_ WHERE user_id=?`,[userid]);
  
});