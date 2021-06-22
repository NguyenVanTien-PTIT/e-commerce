import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ManageOrderService } from '../../services/manage-order.service';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  years: number[]=[2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030];
  year: any = 2021;
  revenues: any[] = [];

  view: any[] = [1200, 370];

  // options
  legendTitle: string = 'Doanh thu năm ' + this.year;
  legendPosition: string = 'below'; // ['right', 'below']
  legend: boolean = true;

  xAxis: boolean = true;
  yAxis: boolean = true;

  yAxisLabel: string = 'Sales';
  xAxisLabel: string = 'Doanh thu năm ' + this.year + ' Đơn vị (đ)';
  showXAxisLabel: boolean = true;
  showYAxisLabel: boolean = true;

  //Trục Oy
  yAxisTicks: any[] = [1000000, 5000000, 7000000, 10000000, 20000000, 100000000]

  animations: boolean = true; // animations on load

  showGridLines: boolean = true; // grid lines

  //Màu từng cột
  colorScheme = {
    domain: ['#704FC4', '#4B852C', '#B67A3D', '#5B6FC8', 
    '#25706F','#704FC4', '#4B852C', '#B67A3D', '#5B6FC8', 
    '#25706F', "#4B852C"]
  };
  schemeType: string = 'ordinal'; // 'ordinal' or 'linear'
  //Khoảng cách 2 cột
  barPadding: number = 10
  //Hiển thị số lượng khi hover vào cột
  tooltipDisabled: boolean = false;


  constructor(private manageOrderService: ManageOrderService, 
    private router: Router,
    private toastr: ToastrService) {}

  ngOnInit(): void {
    this.checkUser();
    this.getRevenue();
  }

  checkUser(){
    let currentUser = JSON.parse(localStorage.getItem('userCurrent'));

    if(!currentUser){
      this.router.navigate(['/home']);
      return;
    }
    let checked = false;
    currentUser.roles.forEach(role =>{
      if(role === 'ADMIN'){
        checked = true;
      }
    })
    if(!checked){
      this.toastr.error('Từ chối truy cập');
      this.router.navigate(['/home']);
      return;
    }
  }

  //Chuyển tên từng cột thành chữ hoa
  formatString(input: string): string {
    return input.toUpperCase()
  }

  formatNumber(input: number): number {
    return input;
  }

  //Thay đổi năm
  changeYear(event){
    this.year = event.value;
    this. legendTitle = 'Doanh thu năm ' + this.year;
    this.xAxisLabel = 'Doanh thu năm ' + this.year + ' Đơn vị (đ)';
    this.getRevenue();
  }
  
  getRevenue(){
    this.manageOrderService.getRevenue(this.year).subscribe(data => {
      console.log(data);
      this.revenues = data;
    })
  }
}
