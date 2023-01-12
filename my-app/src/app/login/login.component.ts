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
    //Creamos el nuevo grupo del formulario
    FormularioLogin = new FormGroup(
      {
        userControl: new FormControl('',[Validators.required,Validators.minLength(6)]),
        passwordControl: new FormControl('',[Validators.required, Validators.minLength(6 )]),
        typeControl: new FormControl('',[Validators.required])
      }
    );
    //Obtener la validacion del campo usuario
    get userValidate(): FormControl{
      return this.FormularioLogin.get('userControl') as FormControl;
    }
    //Obtener la validación del campo contraseña
    get passwordValidate(): FormControl{
      return this.FormularioLogin.get('passwordControl') as FormControl;
    }
    //Obtener la validación del campo tipo de usuario
    get typeValidate(): FormControl{
      return this.FormularioLogin.get('typeControl') as FormControl;
    }
    //Variable para saber si falló el inicio de sesión
    datosErroneos = false
    //Alerte que se muestra en caso del fallo de inicio de sesión
    alert = "Usuario o contraseña incorrectos";
    //Boton de envío de formulario que permite obtener los datos del formulario en un diccionario tipo JSON
    iniciar(): void{
      const credenciales = this.FormularioLogin.value;
      this.datosErroneos = true
      console.log(credenciales);
    }
}
