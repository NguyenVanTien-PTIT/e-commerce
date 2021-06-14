import { HttpClientModule, HttpResponse } from '@angular/common/http';
import { ToastrService } from 'ngx-toastr';
import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { LoginService } from '../services/login.service';
import { FormBuilder, FormGroup, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from '../interfaces/Ilogin';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  private checkSignUp: boolean;

  loginForm:FormGroup;
  user = {} as User;
  public signUpForm = new FormGroup({
    username: new FormControl(''),
    password: new FormControl(''),
    fullname: new FormControl(''),
    phoneNumber: new FormControl(''),
    address: new FormControl(''),
  });

  constructor(
    public dialogRef: MatDialogRef<LoginComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any, 
    private loginService: LoginService, 
    private fb: FormBuilder,
    private router: Router,
    private toastr: ToastrService,
    
  ) {}

  ngOnInit() {
    this.loginForm = this.fb.group({
      username: [''],
      password: ['']
    })
  }

  //Lấy giá trị username và password gửi lên server
  public createData() {
    const newUser: any = {};
    for(let controlName in this.loginForm.controls){
      if(controlName){
        newUser[controlName] = this.loginForm.controls[controlName].value;
      }
    }
    return newUser;
  }

  //Đăng nhập
  login(){
    this.loginService.checkLogin(this.createData()).subscribe((data) =>{
      this.user = data.userDTO;
      if(this.user != null){
        let currentUser = JSON.stringify(data.userDTO); 
        //Lưu user hiện tại và token vào localStorage
        localStorage.setItem('token', data.token);
        localStorage.setItem('userCurrent', currentUser);
        this.user.username = this.loginForm.value.username;
        this.onNoClick();
        window.location.reload();
        this.toastr.success(data.msg);
      }else{
        this.toastr.error('Sai tài khoản hoặc mật khẩu');
      }
    })
  }

  //Lấy giá trị user đăng ký
  public getNewUser() {
    const newUser: any = {};
    for(let controlName in this.signUpForm.controls){
      if(controlName){
        newUser[controlName] = this.signUpForm.controls[controlName].value;
      }
    }
    return newUser;
  }

  //Đăng ký
  signUp(){
    this.loginService.addUser(this.getNewUser()).subscribe(data =>{
      console.log('Nhận dữ liệu đăng ký user: ');
      console.log(data);
      this.toastr.success('Đăng ký thành công!');

    })
    this.checkSignUp = false;
  }
  
  onNoClick(): void {
    this.dialogRef.close();
  }

  //Chuyển sang đăng ký
  goToSignUp(){
    this.checkSignUp = true;
  }

  //Chuyển về đăng nhập
  goToLogin(){
    this.checkSignUp = false;
  }

  getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
  }
}
