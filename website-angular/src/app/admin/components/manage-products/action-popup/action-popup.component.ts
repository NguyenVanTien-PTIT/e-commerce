import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { Component, OnInit, Optional, Inject } from '@angular/core';

@Component({
  selector: 'app-product-action-popup',
  templateUrl: './action-popup.component.html',
  styleUrls: ['./action-popup.component.scss']
})
export class ActionProductPopupComponent implements OnInit {

  action:string;
  product: any;
  categories:any;
  public productForm:FormGroup;

  constructor(
    public dialogRef: MatDialogRef<ActionProductPopupComponent>,
    @Optional() @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder
  ) { 
    this.action = data.action;
    this.product = data;
    this.categories = data.categories;
  }

  ngOnInit() {
    this.loadData();
  }

 //Đổ dữ liệu vào form sửa
  loadData(): void {
    this.productForm = this.fb.group({
      categoryId: ['', Validators.required],
      name: ['', Validators.required],
      price: ['', Validators.required],
      description: ['', Validators.required],
      image: ['', Validators.required],
      createDate: ['']
    })

    //Set form control
    if(this.action === 'edit'){
      for(let controlName in this.productForm.controls){
        this.productForm.controls[controlName].setValue(this.product[controlName]);
      }
    }
  }

  changeCategory(event){
    this.productForm.controls.categoryId.setValue(event.value);
  }

  update(){
    //Lấy giá trị từ các FormControl
    for(let controlName in this.productForm.controls){
      this.product[controlName] = this.productForm.controls[controlName].value;
    }
    console.log('product sau khi sua/ them: ', this.product);
    this.dialogRef.close({event: this.action, data: this.product});
  }

  closeDialog(){
    this.dialogRef.close({event: 'cancel'});
  }
}
