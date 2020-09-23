import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Cart } from '../cart/cart';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.sass']
})
export class HeaderComponent implements OnInit {

  constructor(private cart: Cart,  private router: Router,) { }

  ngOnInit() {
  }

  cartCount(): number{
    return this.cart.count();
  }


  open() {
    // const modalRef = this.modalService.open(SigninModalComponent, { windowClass: 'modal-dialog-centered', size: 'lg' });
    // modalRef.result.then(result => {
    //     if (result) {
    //         // this.landingPageService.loggedIn.next(true);
    //         localStorage.setItem("isLoggedIn", "true");
    //     }
    // });

  this.router.navigateByUrl('/login');
}

}
