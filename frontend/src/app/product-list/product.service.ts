import { Injectable } from '@angular/core';
import { Product } from './product';
import { Observable, of } from 'rxjs';
import { ErrorHandler } from '../error-handler';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { environment } from '../../environments/environment';


/** 
 * Service for providing Product data to the application.
*/
@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private MAIN_API_URL = `${environment.apiEndpoint}`;

  constructor(private http: HttpClient) { }

  getProductList(id: string): Observable<any> {
    const url = this.MAIN_API_URL + "ProductAPI/GetProductByCategory?categoryId=" + id;
    return this.http.get<any>(
      url
    );
  }

  getProductById(id: string): Observable<any> {
      const url = this.MAIN_API_URL + "ProductAPI/GetProductById/" + id;
      return this.http.get<any>(
        url
    );
  }

  getColorList(): Observable<any> {
    const url = this.MAIN_API_URL + "MasterAPI/GetColorList";
    return this.http.get<any>(
      url
    );
  }

  getBrandList(): Observable<any> {
    const url = this.MAIN_API_URL + "MasterAPI/GetBrandList";
    return this.http.get<any>(
      url
    );
  }

  getSizeList(): Observable<any> {
    const url = this.MAIN_API_URL + "MasterAPI/GetSizeList";
    return this.http.get<any>(
      url
    );
  }



  InsertCart = (data: any) => {
    console.log(data);
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
      url, data, options
  );
  }

}
