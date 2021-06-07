import { LoginService } from 'src/app/services/login.service';
import { ToastrService } from 'ngx-toastr';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, FormControl } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profile-information',
  templateUrl: './profile-information.component.html',
  styleUrls: ['./profile-information.component.scss']
})
export class ProfileInformationComponent implements OnInit {

  private id;
  private user: any;
  public profileForm = new FormGroup({
    fullname: new FormControl(''),
    createDate: new FormControl(''),
    phoneNumber: new FormControl(''),
    address: new FormControl(''),
  });

  constructor(
    private loginService: LoginService,
    private router: Router,
    private toastr: ToastrService,
  ) {  
  }

  ngOnInit() {
    this.loadPage();
  }

  //Lấy user hiện tại
  public loadPage() {
    this.user = this.loginService.getUserCurrent();
    if(!this.user){
      this.router.navigate(['/home']);
      console.log('logout')
    }else {
      for(let controlName in this.profileForm.controls){
        if(controlName){
          this.profileForm.controls[controlName].setValue(this.user[controlName]);
        }
      }
    }
  }

  //Cập nhật profile user
  saveUser(user){
    this.refreshUser();
    console.log('user cập nhật: ');
    console.log(user);
    this.loginService.updateUser(user).subscribe((data) =>{
      if(data){
        window.location.reload();
        let currentUser = JSON.stringify(data.userDTO); 
        //Lưu user hiện tại và token vào localStorage
        localStorage.setItem('token', data.token);
        localStorage.setItem('userCurrent', currentUser);
        this.toastr.success('Cập nhật hồ sơ thành công', 'Thông báo');

      }
    })
  }

  //Đóng gói user muốn sửa để gửi lên server
  refreshUser(){
    for(let controlName in this.profileForm.controls){
      if(controlName){
        this.user[controlName] = this.profileForm.controls[controlName].value;
      }
    }
  }
}
