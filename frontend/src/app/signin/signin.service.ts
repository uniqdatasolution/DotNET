import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { LoginModel } from '../authentication/authentication.class';

@Injectable({
  providedIn: 'root'
})
export class SigninService {

MAIN_API_URL = `${environment.apiEndpoint}`;
    isSidebar = new BehaviorSubject<any>(false);
    loggedIn = new BehaviorSubject<any>(false);

    walletBalance = new BehaviorSubject<any>("");


    constructor(private http: HttpClient) {
    }

    validateCustomer(loginModel: LoginModel): Observable<any> {
      const url = this.MAIN_API_URL + "CustomerAPI/ValidateCustomer";
      return this.http.post<any>(
          url, loginModel
      );
    }

    insertCustomer(customer: any): Observable<any> {
      const url = this.MAIN_API_URL + "CustomerAPI/CustometInsertOrUpdate";
      return this.http.post<any>(
          url, customer
      );
    }

}