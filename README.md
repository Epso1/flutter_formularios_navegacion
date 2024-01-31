# flutter_formularios_navegacion

## Descripción

flutter_formularios_navegacion es una aplicación Flutter que permite a los usuarios explorar las provincias y comarcas de la Comunidad Valenciana. La aplicación proporciona el listado de comarcas de cada provincia así como información detallada sobre cada comarca. 
También permite a los usuarios registrarse e iniciar sesión en la aplicación, aunque por el momento no se realiza ninguna comprobación sobre el usuario y la contraseña.


## Características

- Pantalla de inicio de sesión: Los usuarios pueden introducir su nombre de usuario y contraseña para iniciar sesión en la aplicación. Por el momento, la aplicación no realiza ninguna comprobación sobre el usuario y la contraseña.
- Pantalla de provincias: Muestra las diferentes provincias de la comunidad. Los usuarios pueden hacer clic en cada provincia para navegar a la pantalla de comarcas de esa provincia.
- Pantalla de comarcas: Muestra las comarcas de la provincia seleccionada. Los usuarios pueden seleccionar una comarca para navegar a la pantalla de información de esa comarca.
- Pantalla de información de la comarca: Muestra información detallada sobre la comarca seleccionada. La información se muestra en dos pestañas de una barra de navegación.

## Requisitos del sistema

- Flutter SDK: '>=3.2.3 <4.0.0'
- Dart: '>=2.12.0 <3.0.0'
- Android Studio o VS Code con los plugins de Flutter y Dart instalados.
- Un dispositivo o emulador con Android o iOS para ejecutar la aplicación.

## Instalación

1. Clona este repositorio en tu máquina local usando `git clone`.
2. Navega al directorio del proyecto en tu terminal.
3. Ejecuta `flutter pub get` para instalar las dependencias del proyecto.
4. Ejecuta `flutter run` para iniciar la aplicación en un emulador o dispositivo conectado.

## Uso

1. Inicia la aplicación. Serás recibido por la pantalla de inicio de sesión donde encontrarás un botón para registrarte, que hace que se abra el formulario de registro. Opcionalmente, puedes registrarte con cualquier nombre de usuario y contraseña, ya que la aplicación no realiza ninguna comprobación sobre ellos.
2. Opcionalmente, puedes introducir cualquier nombre de usuario y contraseña o no introducir ninguno y haz clic en el botón "Login".
3. Serás llevado a la pantalla de provincias. Haz clic en una provincia para ver sus comarcas.
4. En la pantalla de comarcas, haz clic en una comarca para ver información detallada sobre ella.
5. En la pantalla de información de la comarca, puedes cambiar entre las pestañas para ver diferentes tipos de información sobre la comarca.
6. En cualquier momento, puedes hacer clic en el botón de retroceso del dispositivo o en el botón de retroceso de la barra de navegación para volver a la pantalla anterior.