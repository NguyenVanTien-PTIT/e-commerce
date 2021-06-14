import { LoginService } from 'src/app/shop/services/login.service';
import { FormControl, FormGroup } from '@angular/forms';
import { OderService } from '../../services/oder.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.scss']
})
export class ShoppingCartComponent implements OnInit {
  private id: number = 0;
  
  private orders;
  private calculateOrder;
  private shipFee: number = 0;

  public notifyForm = new FormGroup({
    nameUser: new FormControl(''),
    phoneNumber: new FormControl(''),
    address: new FormControl(''),
    orderDate: new FormControl('')
  });

  constructor( 
    public loginService: LoginService,
    private orderService: OderService,
    private router: Router,
    private toastr: ToastrService) 
    {}

  ngOnInit() {
    this.loadPage();
  }

  //Lấy danh sách sản phẩm và số lượng + order hiện tại của user
  public loadPage() {
    let currentUser = JSON.parse(localStorage.getItem('userCurrent'));

    if(!currentUser){
      this.router.navigate(['/home']);
      return;
    }
    
    this.id = currentUser.id;
    //Load data 
    this.orderService.getOder().subscribe((data) =>{

      if(!data){
        this.router.navigate(['/home']);
        this.toastr.warning('Chỉ cho phép user vào xem giỏ hàng');
        return;
      }

      console.log('order hiện tại của bạn có id user:  '+ this.id)
      console.log(data);
      this.orders = data.orderProducts;
      this.calculateOrder = data.ordersDTO;
      //Set giá trị cho form control nếu có đơn đặt hàng
      if(data.ordersDTO){
        for(let controlName in this.notifyForm.controls){
          if(controlName){
            this.notifyForm.controls[controlName].setValue(data.ordersDTO[controlName]);
          }
        }
      }
    })
  }

  //Thanh toán tiền đặt hàng
  payment(){
    console.log("Thanh toán: ")
    // console.log(this.orderCurrent());
    this.orderService.payment(this.id, this.orderCurrent()).subscribe((data)=>{
      console.log('thanh toán thành công');
      console.log(data);
      this.toastr.success('Thanh toán thành công!', 'Thông báo');
      this.router.navigate(['/home']);
    })
  }
  //Đóng gói order hiện tại thành object gửi lên server khi thanh toán
  orderCurrent(){
    const newOrder: any ={};
    newOrder['id'] = this.calculateOrder.id;
    for(let controlName in this.notifyForm.controls){
      if(controlName){
        newOrder[controlName] = this.notifyForm.controls[controlName].value;
      }
    }
    const status = "status";
    const totalprice = "totalprice";
    newOrder[status]= 1;
    newOrder[totalprice] = this.calculateOrder.totalprice + this.shipFee;
    return newOrder;
  }

  //Xóa sản phẩm trong order
  removeProductOrder(id: number){
    console.log("Xóa productOrder");
    console.log(id);
    this.orderService.removeProductOrder(id).subscribe((data)=>{
      console.log('Xóa order product thành công')
      console.log(data);
      this.orders = data.orderProducts;
      this.calculateOrder = data.ordersDTO;
      this.toastr.success('Đã xóa sản phẩm này!', 'Thông báo');
    });
  }
}
