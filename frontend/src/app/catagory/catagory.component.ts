import { Component, OnInit } from '@angular/core';
import { Product } from '../product-list/product';
import { CatagoryService } from '../catagory/catagory.service';
import { Cart } from '../cart/cart';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-catagory',
  templateUrl: './catagory.component.html',
  styleUrls: ['./catagory.component.sass']
})
export class CatagoryComponent implements OnInit {

  categoryList = [];
  categoryListByType = [];

  constructor(
      private route: ActivatedRoute,
      private catagoryService: CatagoryService,
      private router: Router
  ) { }

  ngOnInit() {
      this.initadmincategoryData();
      this.categoryTypeData();
  }

  private categoryTypeData() {
      this.catagoryService.getCategoryByType(10).subscribe(res => {
          this.categoryListByType = res.Data;
      });
  }

  private initadmincategoryData = () => {
      this.catagoryService.getCategoryList().subscribe(res => {
        this.categoryList = res.Data;
        this.defaultSort();
      });
  }
  productList = (id: any) => {
      this.router.navigate(['/products/'+id ]);
  }

  private defaultSort() {
      // this.categoryList.sort((a, b) => {
      //     if (!!a.CategoryName && !!b.CategoryName) {
      //         return a.CategoryName.toLowerCase().localeCompare(b.CategoryName.toLowerCase());
      //     }
      // });
  }
}