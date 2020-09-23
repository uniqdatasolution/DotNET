import { Component, OnInit } from '@angular/core';
import { Cart } from '../cart/cart';
import { CartCalculator } from '../cart/cart-calculator';
import { Product } from '../product-list/product';
import { ProductSelection } from '../product-list/product-selection';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.sass']
})
export class CartComponent implements OnInit {

  constructor(public cart: Cart, private cartCalculator: CartCalculator) { }

  ngOnInit() {
  }

  subTotal(): number {
    return this.cartCalculator.calculateSubTotal(this.cart);
  }

  remove(product: Product): void {
    this.cart.remove(product);
  }

  onQuantityChange(selection: ProductSelection, quantity: number) {
    if (quantity > 0) {
      selection.quantity = quantity;
    }
    else {
      selection.quantity = 1;
    }
  }
}
