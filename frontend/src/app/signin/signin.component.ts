import { Component, OnInit, Input, AfterViewInit, Injectable } from '@angular/core';
import { LoginModel } from 'src/app/authentication/authentication.class';
import { SigninService } from '../signin/signin.service';
import { AuthenticationService } from 'src/app/authentication/authntication.service';


@Component({
    selector: 'app-signin-fe',
    templateUrl: './signin.component.html',
    styleUrls: ['./signin.component.scss']
})

export class SigninModalComponent implements AfterViewInit {

    loginModel: LoginModel = new LoginModel();
    customerModel: any = {};
    page = "signin";
 
    loggedIn: boolean;
    num1 = Math.floor((Math.random() * 10) + 1);
    num2 = Math.floor((Math.random() * 10) + 1);
    num3: any;
    verifyMobile: boolean = false;
    generatedOtp : any;
  
    isSigninAsAstro: boolean = false;
    form_data: { Email: {}; FirstName: {}; LastName: {}; SocialAppId: {}; SocialAppType: {}; };
   
    constructor(

        private landingPageService: SigninService,
  
        private authenticationService: AuthenticationService

    ) {
        console.log('----cons0')
    }

    ngOnInit() {
       
      }

    ngAfterViewInit() {
    }


    signOut(): void {
        
        localStorage.clear();
        this.loggedIn = false;
    }


    signUp() {
        console.log('+++++Signup', this.num1, this.num2, this.customerModel);
        this.num3 = this.num1 + this.num2;
        let mobileno = this.customerModel.ContactMobile;
        if (this.customerModel.LoginPassword === this.customerModel.ConfirmPassword) {
            if(this.num3 === this.customerModel.answer) {
                this.verifyMobile = true;
                // this.generateOtp(this.customerModel.ContactMobile);
                this.insertUserData();
            } else {
                this.num1 = Math.floor((Math.random() * 10) + 1);
                this.num2 = Math.floor((Math.random() * 10) + 1);
                
            }
        } else {
            
        }
    }

    insertUserData = () => {
        this.customerModel.LoginUserName = this.customerModel.ContactEmail;
        this.landingPageService.insertCustomer(this.customerModel)
            .subscribe((data: any) => {
                if (!!data && data.ErrorMessage == 'Failed') {
                    
                    return;
                }
                if (!!data && !!data.Data && data.IsExist) {
                    console.log('==checking for existing,', data, data.IsExist);
                    
                } else {
                    
                   
                }
            });
    }


    onSubmit(form: any) {
        console.log('====num', this.num1, this.num2)
        if (!this.isSigninAsAstro) {
            this.landingPageService.validateCustomer(this.loginModel)
                .subscribe((data: any) => {
                    if (data.Data.IsExist) {
                        // this.authenticationService.getRefData().subscribe((data: { Data: any[]; }) => {
                        //     if (!!data && !!data.Data[0] && !!data.Data[1]) {
                        //         localStorage.setItem("refDataEntity", JSON.stringify(data.Data[0]))
                        //         localStorage.setItem("refDataValue", JSON.stringify(data.Data[1]))
                        //     }
                        // })
                        localStorage.setItem("userName", data.Data.Data[0].FirstName);
                        localStorage.setItem("customerId", data.Data.Data[0].CustomerId);
                        localStorage.setItem("customerGuId", data.Data.Data[0].CustomerGuId);
                        
                    } else {
                        
                    }
                });
        } else {
           
        }

    }




 



}
