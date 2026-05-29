# REPORTE DE LABORATORIO 04 (INDIVIDUAL)

**Curso:** Control de Versiones para Desarrollo Full Stack  
**Docente:** Ing. Luis Flores  
**Semestre Académico:** I-2026  
**Plataforma:** GitHub & Git CLI

---

## 1. Identificación del Desarrollador

**Nombre Completo:** Luis Enrique Álvarez Soriano  
**Usuario de GitHub:** @LuisIng21  
**Fecha de Entrega:** 28 de Mayo de 2026  
**Repositorio:** https://github.com/LuisIng21/apexpay-dashboard

---

## 2. Hito 1: Implementación de Seguridad Perimetral (.gitignore)

### 1. Estructura del archivo `.gitignore` consolidada localmente:

```text
# Secretos locales de ApexPay
.env
.env.local

# Temporales de compilacion y dependencias generadas por el script
node_modules/
dist/
*.log
```

### 2. Prueba de Inmunidad de Credenciales:

**Comando ejecutado:** `echo "STRIPE_SECRET_KEY=sk_live_51Nz8P3K" > .env && git status`

**Salida esperada en consola:**

```text
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

**Análisis:** El archivo `.env` contiene credenciales sensibles de API (STRIPE_SECRET_KEY) pero permanece completamente invisible para Git. El comando `git status` devuelve "nothing to commit, working tree clean", lo que demuestra que el blindaje perimetral funciona correctamente. El archivo existe físicamente en la máquina local (C:\Users\luise\Desktop\apexpay-dashboard\.env) pero está totalmente inmunizado contra cualquier push accidental.

---

## 3. Hito 2: Resolución de la Colisión de Interfaces (Merge Conflict Solo)

### 1. Discrepancia Técnica Inicial:

**Descripción breve:**

El rechazo inicial del push ocurrió porque el servidor remoto de GitHub contenía una versión actualizada del archivo README.md ("Tema del proyecto: Oscuro") que no existía en el historial local. Git detectó que el local estaba desincronizado y rechazó la operación con error `[rejected] (fetch first)`. Los marcadores inyectados por Git demarcaban claramente dos versiones conflictivas: HEAD local indicaba "Claro" mientras que origin/main indicaba "Oscuro".

### 2. Resultado Consolidado de Consenso:

**Bloque final del README.md donde convive la configuración híbrida resuelta manualmente:**

```markdown
# ApexPay Dashboard
Tema del proyecto: Hibrido
```

**Proceso de resolución:**
1. Se ejecutó `git pull origin main` para descargar cambios remotos y generar el conflicto
2. Git inyectó marcadores `<<<<<<< HEAD`, `=======`, `>>>>>>> [hash]` en README.md
3. Se eliminaron manualmente todos los marcadores de conflicto
4. Se escribió la decisión unificada consensuada: "Tema del proyecto: Hibrido"
5. Se confirmó la reconciliación con `git commit -m "merge: conciliar conflicto de temas en solitario"`
6. Se empujó la resolución a producción con `git push origin main`

---

## 4. Hito 3: Mitigación de Exposición de Infraestructura (git revert)

### 1. Histórico del Historial Clínico de Producción (GitLog):

**Comando ejecutado:** `git log --oneline -8` (rama main)

**Salida:**

```text
8d848c7 (HEAD -> main, origin/main, origin/HEAD) Merge pull request #2 from LuisIng21/feat/footer
a92d033 Merge pull request #1 from LuisIng21/feat/menu-principal
a2af11c (origin/feat/footer, feat/footer) fix: incorporar politicas de privacidad en footer
111c8be (origin/feat/menu-principal, feat/menu-principal) fix: ajustar menu de navegacion segun auditoria interna
59b7c1b feat: estructurar pie de pagina corporativo
2526e50 feat: estructurar el menu principal de navegacion
54d5a50 Revert "feat: modulo de pruebas de red expuestas"
b67d355 feat: modulo de pruebas de red expuestas
```

**Secuencia transparente de eventos críticos:**

- **commit b67d355:** "feat: modulo de pruebas de red expuestas" - EXPOSICIÓN ACCIDENTAL
  - Contenía: `### SERVIDORES DE PRUEBAS EXPUESTOS: Puerto 8080`
  - Riesgo: Divulgación de infraestructura sensible en rama pública

- **commit 54d5a50:** Revert "feat: modulo de pruebas de red expuestas" - CONTRA-MEDIDA SEGURA
  - Generado automáticamente por `git revert b67d355 --no-edit`
  - Mantiene historial íntegro (sin reescrituras)
  - Deja evidencia clara de que el error fue identificado y corregido

### 2. Análisis de Resiliencia Organizacional:

**¿Por qué `git reset --hard` es de alto peligro corporativo en ramas centrales públicas compartidas en GitHub?**

`git reset --hard` es una operación destructiva que reescribe el historial de commits eliminándolos completamente de la base de datos local. Cuando se ejecuta en ramas públicas compartidas:

1. **Ruptura de equipos de desarrollo:** Si el desarrollador A hace `git reset --hard` y fuerza un push (`git push -f`), el historial remoto se reescribe. Los colegas que tengan el commit antiguo en su rama local experimentarán conflictos irresolubles y desincronización permanente.

2. **Pérdida irreversible de auditoría:** En organizaciones con requerimientos de compliance (fintech, banca, seguros), el historial de commits es evidencia legal. Reescribir el historial viola políticas de gobernanza y puede generar sanciones regulatorias.

3. **Imposibilidad de rastreabilidad:** Con `git reset`, no queda constancia de que el error existió ni de cuándo fue corregido. Esto viola principios de trazabilidad organizacional.

**¿Cómo ayuda `git revert` a salvaguardar la estabilidad del equipo de desarrollo?**

`git revert` crea un **nuevo commit "anti-cambio"** que deshace lógicamente los cambios del commit problemático sin eliminar nada del historial:

1. **Seguridad contra desincronización:** El nuevo commit de reversión se puede descargar (`git pull`) sin conflictos. Todos los colegas permanecen sincronizados.

2. **Historial íntegro y auditable:** El commit problemático permanece visible en el historial de Git, acompañado por su commit de reversión. Queda evidencia clara: "error existió, fue identificado por [equipo], fue corregido en [fecha]".

3. **Conformidad regulatoria:** Organizaciones con requisitos HIPAA, SOX, GDPR valoran la trazabilidad. `git revert` genera un registro inmutable de mitigación de riesgos.

4. **Compatibilidad con ramas públicas:** En proyectos de código abierto (open source), cualquier desarrollador que haya clonado el repositorio conserva su historial íntegro sin ruptura de cadena de causalidad.

---

## 5. Hito 4: Enlaces de Gobernanza y Solicitudes de Integración

**Pull Request de Menú (`feat/menu-principal`):** https://github.com/LuisIng21/apexpay-dashboard/pull/1

- **Estado:** ✅ MERGED
- **Rama origen:** feat/menu-principal
- **Rama destino:** main
- **Commits:** 2 (feat + fix)
- **Cambios:** menu.txt actualizado de "Contacto" a "Soporte VIP"
- **Commit de merge:** a92d033

**Pull Request de Footer (`feat/footer`):** https://github.com/LuisIng21/apexpay-dashboard/pull/2

- **Estado:** ✅ MERGED
- **Rama origen:** feat/footer
- **Rama destino:** main
- **Commits:** 2 (feat + fix)
- **Cambios:** footer.txt actualizado con "| Politica de Privacidad"
- **Commit de merge:** 8d848c7

---

## 6. Estructura Final del Repositorio

```
apexpay-dashboard/
├── .env (gitignored - local only)
├── .env.example
├── .gitignore (contiene reglas de blindaje)
├── README.md (configuración híbrida)
├── package.json
├── setup_apexpay.ps1
├── setup_apexpay.sh
├── menu.txt (mergeado de feat/menu-principal)
├── footer.txt (mergeado de feat/footer)
├── src/
│   ├── index.js
│   ├── components/Dashboard.js
│   ├── pages/transactions.html
│   ├── services/api.js
│   └── styles/main.css
├── config/app.config.js
├── tests/dashboard.test.js
└── logs/.gitkeep
```

---

## 7. Validaciones de Éxito

✅ **Fase 1 - Seguridad Perimetral:** Archivo .env local completamente ignorado por Git  
✅ **Fase 2 - Merge Conflict:** Conflicto resuelto manualmente, decisión consensuada "Hibrido"  
✅ **Fase 3 - Git Revert:** Error crítico revertido de forma segura (commit 54d5a50)  
✅ **Fase 4 - Feature Branches:** Dos PRs creadas, mergeadas exitosamente a main  
✅ **Auditoría de Enmiendas:** Code review simulado con correcciones aplicadas  
✅ **Sincronización Final:** Rama main local actualizada y limpia  

---

## 8. Reflexión Técnica - Transferencia de Aprendizaje

### Lecciones Aprendidas:

1. **La prevención supera la remediación:** El `.gitignore` correctamente configurado es más eficiente que detectar y limpiar secretos después de un push accidental.

2. **Importancia de la trazabilidad:** `git revert` preserva la auditoría de cambios, crucial para organizaciones reguladas.

3. **Flujos de trabajo descentralizados:** Las feature branches + Pull Requests permiten que múltiples desarrolladores trabajen simultáneamente sin conflictos centrales.

4. **Automatización en GitHub:** La plataforma web genera automáticamente PRs cuando detecta ramas nuevas, mejorando la experiencia colaborativa.

---

**Reporte generado:** 28 de Mayo de 2026  
**Estado:** ✅ COMPLETADO EXITOSAMENTE
