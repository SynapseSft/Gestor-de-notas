import { Component, OnInit } from '@angular/core';
import { Validators,FormControl, FormGroup} from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit{
    ngOnInit(): void {
      throw new Error('Method not implemented.');
    }
    FormularioLogin = new FormGroup(
      {
        userControl: new FormControl('',[Validators.required,Validators.minLength(6)]),
        passwordControl: new FormControl('',[Validators.required, Validators.minLength(6 )]),
        typeControl: new FormControl('',[Validators.required])
      }
    );
    get userValidate(): FormControl{
      return this.FormularioLogin.get('userControl') as FormControl;
    }
    get passwordValidate(): FormControl{
      return this.FormularioLogin.get('passwordControl') as FormControl;
    }
    get typeValidate(): FormControl{
      return this.FormularioLogin.get('typeControl') as FormControl;
    }
    datosErroneos = false
    alert = "Usuario y contraseña incorrectos";
    iniciar(): void{
      const credenciales = this.FormularioLogin.value;
      this.datosErroneos = true
      console.log(credenciales);
    }
}
