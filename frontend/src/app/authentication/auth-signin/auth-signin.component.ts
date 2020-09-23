import { Component, OnInit } from '@angular/core';
import { LoginModel } from '../authentication.class';
import { AuthenticationService } from '../authntication.service';
import { Router } from '@angular/router';
import 'sweetalert2/src/sweetalert2.scss';


@Component({
  selector: 'app-auth-signin',
  templateUrl: './auth-signin.component.html',
  styleUrls: ['./auth-signin.component.scss']
})
export class AuthSigninComponent implements OnInit {
  secret = 'AstroHelps';

  loginModel: LoginModel = new LoginModel();
  constructor(private authenticationService: AuthenticationService,
    private router: Router
  ) {
  }
  ngOnInit() {
  }

  onSubmit(form: any) {
    console.log(this.loginModel.Password)
    // this.dec_hash = CryptoJS.enc.Base64.parse(this.loginModel.Password);
    // this.dec = CryptoJS.enc.Base64.stringify(this.dec_hash);
    // console.log(this.dec);

    this.authenticationService.validateUser(this.loginModel)
      .subscribe((data: any) => {
        console.log("validateUser"+ JSON.stringify(data))
        if (!!data && !!data.data) {
          let response = data.data;
          if (response.length > 0) {
              var userData = response[0];
              localStorage.setItem("AdminUserDetail", JSON.stringify(userData));
              localStorage.setItem("IsLoggedIn", "true");
            this.authenticationService.getRefData().subscribe(data => {
              if (!!data && !!data.data[0] && !!data.data[1]) {
                localStorage.setItem("refDataEntity", JSON.stringify(data.data[0]))
                localStorage.setItem("refDataValue", JSON.stringify(data.data[1]))
              }
              this.router.navigate(['/admin/users/admin-users']);
            })
          } else {
           
          }
        }
        else {
          
        }
      });
  }

}
