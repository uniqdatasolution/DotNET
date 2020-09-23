import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate {

  constructor(private _router: Router) {
  }
  canActivate(route: import("@angular/router").ActivatedRouteSnapshot, state: import("@angular/router").RouterStateSnapshot): boolean | import("@angular/router").UrlTree | import("rxjs").Observable<boolean | import("@angular/router").UrlTree> | Promise<boolean | import("@angular/router").UrlTree> {

    if (!!localStorage.getItem("IsLoggedIn")) {
      let d = localStorage.getItem("IsLoggedIn");
      if (d == "true") {
        return true;

      } else {
        this._router.navigate(['/admin']);
        return false;
      }
    } else {
      this._router.navigate(['/admin']);
      return false;
    }

  }
}
