import { Injectable } from '@angular/core';
import { LoginModel } from './authentication.class';

import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})

export class AuthenticationService {
  MAIN_API_URL = `${environment.apiEndpoint}`;
  constructor(private http: HttpClient) {
  }

  validateUser = (loginModel: LoginModel) => {
    let headers = new HttpHeaders({
      'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Credentials': 'true',
                'Access-Control-Allow-Headers': 'Content-Type',
                'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
    });
    let options = { headers: headers };
    const url = this.MAIN_API_URL + "MasterAPI/ValidateUser";
    // return this.coreHttpService.httpPostRequest<LoginModel, any>(url, loginModel, headers);
    return this.http.post<any>(
      url, loginModel, options
  );
  }

  getRefData(): Observable<any> {
    const url = this.MAIN_API_URL + "MasterAPI/GetRefData";
    // return this.coreHttpService.httpGetRequest<any>(url);
    return this.http.get<any>(
      url
  );
  }
}