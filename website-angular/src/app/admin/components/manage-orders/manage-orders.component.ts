import { OrderDeletePopupComponent } from './delete-popup/order-delete-popup.component';
import { OrderActionPopupComponent } from './action-popup/order-action-popup.component';
import { MatDialog } from '@angular/material';
import { ManageOrderService } from '../../services/manage-order.service';
import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-manage-orders',
  templateUrl: './manage-orders.component.html',
  styleUrls: ['./manage-orders.component.scss']
})
export class ManageOrdersComponent implements OnInit {
  private orders:any;
  statusCurrent:number;
  page:number;
  pageSize:number = 5;
  totalOrders:number;
  status:any = {
    0: 'Đang đặt hàng',
    1: 'Chờ xác nhận',
    2: 'Đang giao hàng',
    3: 'Đã giao hàng'
  };

  constructor(
    private manageOrderService: ManageOrderService, 
    private toast: ToastrService,
    private dialog: MatDialog) { }

  ngOnInit() {
    this.page = 1;
    this.statusCurrent = 0;
    this.loadData();
  }

  loadData(){
    this.getOrderByStatus(this.statusCurrent);
  }

  getOrderByStatus(status:number){
    if(status !== this.statusCurrent){
      this.page = 1;
    }
    this.statusCurrent = status;
    this.manageOrderService.getOrderByStatus(status, this.page, this.pageSize).subscribe(data => {
      this.orders = data;
    })
    this.manageOrderService.countOrderByStatus(status).subscribe(data => {
      this.totalOrders = data;
    })
  }

  handlePageChange(event){
    this.page = event;
    this.getOrderByStatus(this.statusCurrent);
  }

  //Click duyệt
  changeStatus(id:number){
    //Duyệt sang xác nhận
    if(this.statusCurrent === 1){
      this.manageOrderService.changeStatus(id).subscribe(data=>{
        if(data.httpStatus === 'OK'){
          this.toast.success(data.msg);
        }else{
          this.toast.error(data.msg);
        }
        this.page = 1;
        this.loadData();
      })
    }
    //Duyệt sang đã giao hàng
    else if(this.statusCurrent === 2){
      this.manageOrderService.changeStatus(id).subscribe(data=>{
        if(data.httpStatus === 'OK'){
          this.toast.success(data.msg);
        }else{
          this.toast.error(data.msg);
        }
        this.page = 1;
        this.loadData();
      })
    }
  }

  //Sửa đơn hàng
  edit(u: any, action: string){
    u.action = action;
    const dialogRef = this.dialog.open(OrderActionPopupComponent, {data: u});

    dialogRef.afterClosed().subscribe(result => {
      if(!result){
        return;
      }
      if(result.event === 'edit'){
        this.manageOrderService.updateOrder(result.data).subscribe(data => {
          if(data.httpStatus === 'OK'){
            this.toast.success(data.msg);
          }else{
            this.toast.error(data.msg);
          }
          this.loadData();
        })
      }
    })
  }

  delete(u, action){
    u.action = action;
    const dialogRef = this.dialog.open(OrderDeletePopupComponent, {data: u});
    dialogRef.afterClosed().subscribe(result => {
      if(!result){
        return;
      }
      if(result.event === 'delete'){
        this.manageOrderService.deleteOrder(result.data.id).subscribe(data => {
          if(data.httpStatus === 'OK'){
            this.toast.success(data.msg);
          }else{
            this.toast.error(data.msg);
          }
          this.loadData();
        });
      }
    })
  }
}
