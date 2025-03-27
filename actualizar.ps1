# Ruta del proyecto
$RUTA_PROYECTO = "D:\Proyectos\agenda-deportiva"

# Mensaje para el commit (puedes personalizarlo con fecha y hora)
$MENSAJE_COMMIT = "Actualización automática: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# Ir a la carpeta del proyecto
Set-Location $RUTA_PROYECTO

# Comprobar si hay cambios en el repositorio
$CAMBIOS = git status --porcelain

if ($CAMBIOS -ne "") {
    # Agregar todos los cambios
    git add .

    # Hacer commit con mensaje automático
    git commit -m $MENSAJE_COMMIT

    # Enviar los cambios a GitHub
    git push origin main

    Write-Host "✅ Actualización realizada correctamente."
} else {
    Write-Host "⏳ No hay cambios nuevos en el JSON, no se realizó ningún push."
}
