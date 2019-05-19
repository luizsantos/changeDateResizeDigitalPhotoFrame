# changeDateResizeDigitalPhotoFrame
This Linux script change the date of JPG files, using dates presents in the file or directory name.
This script also permit resize a JPG files.

I made this script because my digital photo frame only sort photos by date (not name or directory).

* To work, the date in the file name must has the format:
  - ????YYYYmmdd?HHMM* 
  - i.e IMG_20180220_184533584.jpg (default name on the Motorola/Android)

* The date in the directory name must has the format:
  - YYYY-mm-dd* 
  - i.e 2017-01-14-batizado/

To resize the photo files use the option -r ou --resize. 

##pt-BR

Tenho um porta retrato digital que só ordena fotos pela data do arquivo, não por nome do arquivo ou pastas/diretórios. 
Assim, para as fotos não ficarem uma bagunça (fora de ordem). Eu criei esse script Linux que pega a data contida no mome 
do arquivo/diretório e altera a data do arquivo, colocando a data extraída do nome do arquivo/diretório. Então:

1.  O script primeiro tenta usar a data que está no mome do arquivo (usei o padrão de nome de arquivo dos camera padrão dos 
celulares Android Motorola. 

2. Caso o script não consiga extrair tal data do nome, ele utiliza a data que está no nome do diretório. Neste caso como 
eu separo minhas fotos por pastas e sempre coloco a data como nome desses diretórios).

3. caso não seja possível extrair a data do nome do arquivo ou diretório, tal data de criação/modificação do arquivo não será alterada.

Desta forma: 
* Para mudar a data do arquivo, segundo o seu nome, é necessário que o nome do arquivo tenha o seguinte formato:
    - ????AAAAmmdd?HHMM*
    - Exemplo: IMG_20180220_184533584-HDR.jpg
    
* Para mudar a data do arquivo, segundo o seu nome de diretório, é necessário que o nome do diretório tenha o seguinte formato:
    - AAAA-mm-dd* 
    - Exemplo: 2017-01-14-batizado/

O script também permite redimensionar fotos para a resolução 1024x768, já que normalmente o porta retrato não é
tão grande, desta forma cabem mais fotos. Para isso basta utilizar a opção -r ou --resize. Caso não seja passada nenhuma opção 
o script apenas altera a data dos arquivos e não redimensiona as fotos.
