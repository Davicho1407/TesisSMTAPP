import 'package:flutter/material.dart';
import 'package:smt_app/auth/forget_pass.dart';
import 'package:smt_app/auth/registro_page.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/drawer_admin.dart';
import 'package:smt_app/auth/login_page.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/controlMonitoreo/analisis_datos.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/perfil_usuario/perfil.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/paginaprincipalAdmin/nosotros_screen.dart';
import 'package:smt_app/ui/drawer/drawerUser/drawer_user.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/administracion/administracionAdmin.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/controlMonitoreo/control_monitoreo.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/page_control/reportes/reportes.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginacontrolUser/administracion/administracionUsers.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginacontrolUser/controlMonitoreo/control_monitoreo.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginacontrolUser/perfil_user/perfilUser.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginacontrolUser/reportes/reportes.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginaprincipalUser/clima.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginaprincipalUser/cultivo_screen_user.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginaprincipalUser/finca_screen_user.dart';
import 'package:smt_app/ui/drawer/pagina_principal/clima/clima.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/paginaprincipalAdmin/cultivo_screen.dart';
import 'package:smt_app/ui/drawer/drawerAdmin/paginaprincipalAdmin/finca_screen.dart';
import 'package:smt_app/ui/drawer/drawerUser/paginaprincipalUser/nosotros_screen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const forgetpass = '/forgetpass';
  static const register = '/registro';
  static const drawerAdmin = '/drawerAdmin';
  static const drawerUser = '/drawerUser';
  //Control de la aplicacion admin
  static const controlMonitoreo = '/controlMonitoreo';
  static const analisisDatos = '/analisisD';
  static const reportes = '/reportes';
  static const administracionAdmin = '/administracionAdmin';
  static const perfilAdmin = '/perfilAdmin';
  //Control de la aplicación user
  static const controlMonitoreoUser = '/controlMonitoreoUser';
  static const reportesUser = '/reportesUser';
  static const administracionUsers = '/administracionUsers';
  static const perfilUser = '/perfilUser';

  //Navegacion a los botones de pantalla principal admin
  static const clima = '/clima';
  static const finca = '/finca';
  static const cultivos = '/cultivos';
  static const nosotros = '/nosotros';
  //Navegacion a los botones de la pantalla principal user
  static const climaUser = '/climaUser';
  static const fincaUser = '/fincaUser';
  static const cultivosUser = '/cultivosUser';
  static const nosotrosUser = '/nosotrosUser';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return _buildRoute(LoginPage.create);
      case forgetpass:
        return _buildRoute(ForgetPassword.create);
      case register:
        return _buildRoute(RegisterPage.create);
      //Redireccion manejo admin
      case drawerAdmin:
        return _buildRoute(DrawerAdmin.create);

      case controlMonitoreo:
        return _buildRoute(ControlMonitoreo.create);
      // case analisisDatos:
      //   return _buildRoute(AnalizarDatos.create);
      case reportes:
        return _buildRoute(Reportes.create);
      case administracionAdmin:
        return _buildRoute(AdministracionesAdmin.create);
      case perfilAdmin:
        return _buildRoute(PerfilAdmin.create);
      case clima:
        return _buildRoute(ClimaPage.create);
      case finca:
        return _buildRoute(FincaScreen.create);
      case cultivos:
        return _buildRoute(CultivosScreen.create);
      case nosotros:
        return _buildRoute(NosotrosScreen.create);
      //Redireccion manejo user
      case drawerUser:
        return _buildRoute(DrawerUser.create);
      case controlMonitoreoUser:
        return _buildRoute(ControlMonitoreoUser.create);
      case reportesUser:
        return _buildRoute(ReportesUser.create);
      case administracionUsers:
        return _buildRoute(AdministracionesUsers.create);
      case perfilUser:
        return _buildRoute(PerfilUser.create);
      case climaUser:
        return _buildRoute(ClimaPageUser.create);
      case fincaUser:
        return _buildRoute(FincaScreenUser.create);
      case cultivosUser:
        return _buildRoute(CultivosScreenUser.create);
      case nosotrosUser:
        return _buildRoute(NosotrosScreenUser.create);
      default:
        throw Exception('Route no existe');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
