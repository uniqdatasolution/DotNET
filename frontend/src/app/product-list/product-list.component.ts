import { Component, OnInit } from '@angular/core';
import { Product } from '../product-list/product';
import { ProductService } from '../product-list/product.service';
import { Cart } from '../cart/cart';
import { FormControl } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { SigninModalComponent } from '../signin/signin.component';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.sass']
})

export class ProductListComponent implements OnInit {

  productAdded: Product | null;

  quantityOptions = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  ];

  productList = [];
  colorList = [];
  brandList = [];
  sizeList = [];
  originalProductList = [];
  searchData = new FormControl("");
  categoryId: any;
  categoryDetails: any;


  constructor(
      private route: ActivatedRoute,
      private productService: ProductService,
      private router: Router,
      private cart: Cart,
      
  ) {


  }

  ngOnInit() {
      this.route.params.subscribe(res => {
          this.categoryId = res.id;
      })
      // this.getCategoryDetails();
      this.getProductList();
      this.getColorDetails();
      this.getBrandDetails();
      this.getSizeDetails();
  }

  // private getCategoryDetails() {
  //     this.landingPageService.getCategoryById(this.categoryId).subscribe(res => {
  //         if(res) {
  //             this.categoryDetails = res.Data[0];
  //             // console.log('==category', this.categoryDetails)
  //         }
  //     });
  // }

  private getProductList() {

      this.productService.getProductList(this.categoryId).subscribe(res => {
          if(res) {
              this.productList = res.Data;
              // console.log('===ProductList', this.productList);
          }
      });

      // this.route.data.subscribe(res => {
      //     if (!!res && !!res.productList) {
      //         if (res.productList.ErrorMessage != "Failed") {
      //             this.productList = res.productList.Data;
      //             console.log('==========AAAAAAAAAAAAAAAAAAAA', res.productList);
      //             console.log('==========AAAAAAAAAAAAAAAAAAAA', res);
      //             this.originalProductList = this.productList;
      //             this.defaultSort();
      //         } else {
      //             this.toastr.error("Failed", "Something went wrong");
      //         }
      //     }
      // });

      
      // this.searchData.valueChanges
      //     .subscribe(searchText => {
          //         this.productList = KjSearch.filterArrayByString(
              //             this.originalProductList,
              //             searchText
              //         );
              //         this.defaultSort();
              //     });
  }

  getProductDetails(productId: any) {
      this.router.navigate(['/home/landing-page/fe-product-detail', { id: productId }]);
  }

  getColorDetails() {
    this.productService.getColorList().subscribe(res => {
      if(res) {
          this.colorList = res.Data;
          // console.log('===ProductList', this.productList);
      }
  });
  }

  getBrandDetails() {
    this.productService.getBrandList().subscribe(res => {
      if(res) {
          this.brandList = res.Data;
          // console.log('===ProductList', this.productList);
      }
  });
  }

  getSizeDetails() {
    this.productService.getSizeList().subscribe(res => {
      if(res) {
          this.sizeList = res.Data;
          // console.log('===ProductList', this.productList);
      }
  });
  }

  orderProduct(productId: any) {
      this.router.navigate(['/home/landing-page/buy-product', { id: productId }]);
  }

  // private defaultSort() {
  //     this.productList.sort((a, b) => {
  //         if (!!a.ProductName && !!b.ProductName) {
  //             return a.ProductName.toLowerCase().localeCompare(b.ProductName.toLowerCase());
  //         }
  //     });
  // }



  addToCart(product: any, quantity: number): void {
    var cust = localStorage.getItem("customerId");
    console.log(cust)
    if(cust != undefined){
      
      console.log(product)
    
      var cartdata = {
        "CustomerId": cust,
        "ProductId": product['ProductId'],
        "ProductName": product['ProductName'],
        "Quantity": quantity
      }
      this.productService.InsertCart(cartdata)
      this.cart.add(product, quantity);
      this.productAdded = product;
      
    }else{
      this.router.navigateByUrl('/login');
    }
 
    
  }

  clearAdd(): void {
    this.productAdded = null;
  }

//   open() {
//     // const modalRef = this.modalService.open(SigninModalComponent, { windowClass: 'modal-dialog-centered', size: 'lg' });
//     // modalRef.result.then(result => {
//     //     if (result) {
//     //         // this.landingPageService.loggedIn.next(true);
//     //         localStorage.setItem("isLoggedIn", "true");
//     //     }
//     // });

//   this.router.navigateByUrl('/login');
// }


}


