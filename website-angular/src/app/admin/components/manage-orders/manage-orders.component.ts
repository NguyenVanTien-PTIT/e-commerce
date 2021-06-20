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
    1: 'Đã thanh toán',
    2: 'Đã giao'
  };
  constructor(
    private manageOrderService: ManageOrderService, 
    private toast: ToastrService) { }

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

  changeStatus(id:number){
    //Duyệt sang xác nhận
    if(this.statusCurrent === 1){
      this.manageOrderService.changeStatus(id).subscribe(data=>{
        if(data.httpStatus === 'OK'){
          this.toast.success(data.msg);
        }else{
          this.toast.error(data.msg);
        }
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
        this.loadData();
      })
    }
  }

}
