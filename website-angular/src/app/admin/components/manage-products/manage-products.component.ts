import { Component, OnInit } from '@angular/core';
import { ManageProductService } from '../../services/manage-product.service';

@Component({
  selector: 'app-manage-products',
  templateUrl: './manage-products.component.html',
  styleUrls: ['./manage-products.component.scss']
})
export class ManageProductsComponent implements OnInit {
  private page: number;
  private pageSize:number = 5;
  totalProducts : number;
  products: any;
  //Chỉ hiện thị phân trang khi cần thiết
  paginationIsDisplay: boolean = true;
  constructor(
    private productService: ManageProductService,
  ) { }

  ngOnInit() {
  }

  loadData() {
    this.productService
  }

}
