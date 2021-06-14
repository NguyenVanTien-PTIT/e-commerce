import { ToastrService } from 'ngx-toastr';
import { Component, OnInit, Output } from '@angular/core';
import { MatDialog } from '@angular/material';
import { LoginComponent } from '../../login/login.component';
import { LoginService } from '../../services/login.service';
import { User } from '../../interfaces/Ilogin';
import { EventEmitter } from '@angular/core';
import { Router } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { LoadingService } from 'src/app/shop/services/loading.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  loadingEnable: boolean;
  sidenavEnable = false;
  isLogin: boolean;
  private userCurrent: any;

  @Output()
  sidenav = new EventEmitter();

  toggelSidenav() {
    this.sidenav.emit('toggel');
  }

  constructor(
    public dialog: MatDialog, 
    private router: Router, 
    public loginService: LoginService,
    public loadingService: LoadingService,
    private toastr: ToastrService) { 
  
    }


  ngOnInit() {
    this.userCurrent = this.loginService.getUserCurrent();
    console.log('user current',this.userCurrent)
  }

  showCart() {
    this.router.navigate(['shopping-cart/'+this.userCurrent.id])
  }


  enableSidenav() {
    this.sidenavEnable = !this.sidenavEnable;
  }
  openLoginDialog(): void {
    const dialogRef = this.dialog.open(LoginComponent, {

    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
    });
  }

  //Đăng xuất
  logout() {
    this.userCurrent = null;
    this.toastr.info('Đã đăng xuất')
    localStorage.removeItem('token');
    localStorage.removeItem('userCurrent');
    window.location.reload();
  }

  //Chuyển sang trang order
  openOrder(){
    this.router.navigate(['/shopping-cart/'+this.userCurrent.id]);
  }
  
  //Chuyển hướng sang profile
  openProfile(){
    this.router.navigate(['/myprofile']);
  }
}
