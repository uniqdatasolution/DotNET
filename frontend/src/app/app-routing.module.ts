import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProductListComponent } from './product-list/product-list.component';
import { CartComponent } from './cart/cart.component';
import {CatagoryComponent} from './catagory/catagory.component'
import {SigninModalComponent} from './signin/signin.component'
const routes: Routes = [

  { path: '', redirectTo: '/catagory', pathMatch: 'full' },
  { path: 'login', component: SigninModalComponent },
  { path: 'catagory', component: CatagoryComponent },
  { path: 'products/:id', component: ProductListComponent },
  { path: 'cart', component: CartComponent },
  { path: 'checkout', loadChildren: './checkout/checkout.module#CheckoutModule' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
