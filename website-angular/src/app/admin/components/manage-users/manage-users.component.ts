import { ActionPopupComponent } from './action-popup/action-popup.component';
import { PopupDeleteComponent } from './popup-delete/popup-delete.component';
import { ToastrService } from 'ngx-toastr';
import { ManageUserService } from './../../services/manage-user.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material';
import { Router } from '@angular/router';

@Component({
  selector: 'app-manage-users',
  templateUrl: './manage-users.component.html',
  styleUrls: ['./manage-users.component.scss']
})
export class ManageUsersComponent implements OnInit {
  page: number = 1;
  pageSize:number = 5;
  totalUsers : number;
  users: any;
  //Chỉ hiện thị phân trang khi cần thiết
  paginationIsDisplay: boolean = true;

  constructor(
    private managerUserService: ManageUserService,
    public toast: ToastrService,
    private dialog: MatDialog,
    private router: Router,
  ) { }

  ngOnInit() {
    this.loadUsers();
  }

  //Load data
  public loadUsers() {
    this.managerUserService.getAllUsers(this.page, this.pageSize).subscribe(data => {
      console.log(data)
      if(data == null){
        this.router.navigate(['/home']);
        this.toast.error('Từ chối truy cập');
        return;
      }
      this.users= data;
    })
    this.managerUserService.countUsers().subscribe(count => {
      this.totalUsers = count;
      if(count > 0){
        this.paginationIsDisplay = true;
      }else{
        this.paginationIsDisplay = false;
      }
    })
  }

  //Lấy danh sách user trang tiếp theo
  handlePageChange(event:any) {
    this.page = event;
    this.loadUsers();
  }

  //Xóa
  delete(u: any, action: string){
    u.action = action;
    //Mở popup xóa
    const dialogRef = this.dialog.open(PopupDeleteComponent, {
      data: u
    });

    //Nhận dữ liệu và xử lý xóa sau khi popup xóa đóng lại
    dialogRef.afterClosed().subscribe(result => {
      console.log('Ban da chon: ',result);
      if(result === undefined){
        console.log('click ra ngoài')
        return;
      }
      //Xóa và thông báo kết quả
      if(result.event === 'delete'){
        this.managerUserService.deleteUser(result.data.id).subscribe(
          (res) =>{
            if(res.httpStatus === 'BAD_REQUEST'){
              this.toast.error(res.msg);
            }else if(res.httpStatus === 'OK'){
              this.toast.success(res.msg);
              this.loadUsers();
            }
          }
        );
      }
    });
  }

  //Sửa user
  edit(u: any, action: string) {
    u.action = action;
    //Mở popup action
    const dialogRef = this.dialog.open(ActionPopupComponent, {
      data: u
    });
    dialogRef.afterClosed().subscribe(result =>{
      if(result === undefined){
        console.log('click ra ngoài')
        return;
      }
      if(result.event === 'edit'){
        this.managerUserService.updateUser(result.data).subscribe(data =>{
          if(data.httpStatus === 'OK'){
            this.toast.success(data.msg);
          }else{
            this.toast.error(data.msg);
          }
          this.loadUsers();
        });
      }
    })
  }

  //Thêm user
  add(action: string){
    const newUser:any = {};
    newUser.action = action;
     //Mở popup action
     const dialogRef = this.dialog.open(ActionPopupComponent, {
      data: newUser
    });

    dialogRef.afterClosed().subscribe(result =>{
      if(result === undefined){
        console.log('click ra ngoài')
        return;
      }

      if(result.event === 'add'){
        this.managerUserService.addUser(result.data).subscribe(data =>{
          if(data.httpStatus === 'OK'){
            this.toast.success(data.msg);
          }else{
            this.toast.error(data.msg);
          }
          this.loadUsers();
        });
      }
    })
  }
}
