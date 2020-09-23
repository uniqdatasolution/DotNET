import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { ErrorHandler } from '../error-handler';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { environment } from '../../environments/environment';


@Injectable({
  providedIn: 'root'
})

export class CatagoryService {

  private MAIN_API_URL = `${environment.apiEndpoint}`;

  constructor(private http: HttpClient) { }

  getCategoryList(): Observable<any> {
    const url = this.MAIN_API_URL + "CategoryAPI/GetCategoryListForCustomer";
    return this.http.get<any>(
        url
    );
}

  getCategoryById(id: string): Observable<any> {
    const url = this.MAIN_API_URL + "CategoryAPI/GetCategoryById?categoryId=" + id;
    return this.http.get<any>(
        url
    );

}

getCategoryByType(id: string | number): Observable<any> {
    const url = this.MAIN_API_URL + "CategoryAPI/GetCategoryByCategoryType?categoryType=" + id;
    return this.http.get<any>(
        url
    );
}
}
