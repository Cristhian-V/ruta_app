# Ruta App

Aplicación móvil tipo *ride-hailing* (**"Ruta"**) que integra dos servicios en una sola plataforma:

- **Viajes de pasajeros** — solicitud de viajes con conductor y seguimiento en tiempo real.
- **Mandados** — un repartidor compra y entrega productos por encargo (lista de compras + compra + entrega).

La plataforma se compone de **tres frentes**:

1. App de **pasajeros** (Android)
2. App de **conductores / repartidores** (Android)
3. **Panel de administración** web

> **Estado actual: fase de propuesta.**
> Todavía no hay código de la aplicación. Este repositorio contiene por ahora el
> **paquete comercial** (documento, capturas y mockups HTML/CSS). El código fuente se
> agregará cuando comience el desarrollo.
>
> *Nota: "Ruta" es un nombre de trabajo; el nombre y la identidad de marca definitivos se definen con el cliente.*

## Contenido del repositorio

```
.
├── README.md
├── openspec/                     # Configuración y specs (OpenSpec)
├── .opencode/                    # Configuración de opencode (skills, comandos)
└── propuesta-cliente/            # Paquete de la propuesta comercial
    ├── borrador-propuesta.md     # Documento fuente (editable)
    ├── borrador-propuesta.pdf    # PDF para el cliente (16 páginas)
    ├── capturas/                 # Capturas de pantalla (PNG, generadas)
    ├── mockups/                  # Código HTML/CSS de las 13 pantallas
    ├── pdf-style.css             # Estilos de impresión del PDF
    ├── render.sh                 # Regenera las capturas (chromium)
    └── build-pdf.sh              # Regenera el PDF (marked + chromium)
```

## Modelo de negocio (resumen)

- **Tarifa** = `(km × costo por km) + (tiempo × costo por minuto) + Bs 6 (uso de la app)`,
  con **multiplicadores dinámicos** por **lluvia** y **horas pico**.
- **Comisión**: **porcentaje del total del viaje** (por defecto 10 %), configurable por el admin.
- **Crédito del conductor**: la comisión se descuenta del saldo; el conductor **recarga**
  pagando en efectivo y el admin **acredita** desde el panel (tarea de recarga).
- **Pago**: en efectivo (sin pasarela de pago en esta etapa).

## Stack previsto

| Capa | Tecnología |
|---|---|
| Apps móviles | Android nativo o React Native *(a definir)* |
| Backend | API REST + WebSocket (tiempo real) |
| Base de datos | PostgreSQL (con extensión geoespacial) |
| Mapas | Google Maps Platform |
| Notificaciones | Firebase Cloud Messaging (FCM) |
| Verificación | SMS / OTP |
| Infraestructura | VPS (Hostinger / Contabo) |

## Regenerar el material de la propuesta

Requiere **`chromium`** y **`npx`** (Node).

```bash
cd propuesta-cliente
./render.sh      # regenera las capturas PNG desde mockups/
./build-pdf.sh   # regenera el PDF desde el Markdown
```

## Próximos pasos

1. Aprobación de la propuesta por el cliente.
2. Definición del stack definitivo.
3. Inicio del desarrollo (backend, apps y panel de administración).

## Repositorio

<https://github.com/Cristhian-V/ruta_app>
