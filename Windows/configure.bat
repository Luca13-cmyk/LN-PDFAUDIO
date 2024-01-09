@echo off
set "PYTHON_SCRIPT_PATH=./ln-pdfaudio.bat"
set "REQUIREMENTS_PATH=../requirements.txt"

REM Adiciona o caminho do script Python às variáveis de ambiente
setx PATH "%PATH%;%PYTHON_SCRIPT_PATH%" /M

echo Caminho do script Python adicionado às variáveis de ambiente.
echo Reinicie o prompt de comando para que as alterações tenham efeito.

echo Instalando dependências...

pip install -m %REQUIREMENTS_PATH%



