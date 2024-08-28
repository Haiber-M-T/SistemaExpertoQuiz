
#HAIBER MONTAÑA TORRES
import tkinter as tk
from tkinter import messagebox
import clips

def cargar_reglas(env):
    """
    Carga el archivo de reglas en el entorno de CLIPS.
    """
    try:
        env.load('reglas.clp')
        print("Reglas cargadas correctamente.")
    except clips.CLIPSError as e:
        print(f"Error al cargar las reglas: {e}")

def crear_hecho_cliente(env, nombre, presupuesto, tipo_viaje, preferencia):
    """
    Crea un hecho en CLIPS con los datos del cliente.
    """
    hecho_cliente = f'(cliente (nombre "{nombre}") (presupuesto {presupuesto}) (tipo-viaje {tipo_viaje}) (preferencia {preferencia}))'
    env.assert_string(hecho_cliente)

def ejecutar_inferencia(env):
    """
    Ejecuta el motor de inferencia de CLIPS y muestra los resultados.
    """
    env.run()
    mensajes = []
    for fact in env.facts():
        if fact.template.name == "salida":
            mensajes.append(fact["mensaje"])
    return mensajes

def mostrar_resultados(resultados):
    """
    Muestra los resultados de la inferencia en un cuadro de diálogo.
    """
    if resultados:
        messagebox.showinfo("Recomendaciones", "\n".join(resultados))
    else:
        messagebox.showinfo("Recomendaciones", "No se encontraron recomendaciones para los datos ingresados.")

def enviar_datos():
    """
    Recoge los datos del formulario y ejecuta el motor de inferencia.
    """
    nombre = entry_nombre.get()
    presupuesto = entry_presupuesto.get()
    tipo_viaje = tipo_viaje_var.get()
    preferencia = preferencia_var.get()

    if not nombre or not presupuesto or not tipo_viaje or not preferencia:
        messagebox.showwarning("Advertencia", "Todos los campos son obligatorios.")
        return

    try:
        presupuesto = float(presupuesto)
    except ValueError:
        messagebox.showwarning("Advertencia", "El presupuesto debe ser un número.")
        return

    env = clips.Environment()
    cargar_reglas(env)
    crear_hecho_cliente(env, nombre, presupuesto, tipo_viaje, preferencia)
    resultados = ejecutar_inferencia(env)
    mostrar_resultados(resultados)

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Sistema Experto de Viajes")
ventana.geometry("400x300")

# Variables de Tkinter
tipo_viaje_var = tk.StringVar()
preferencia_var = tk.StringVar()

# Crear el formulario
tk.Label(ventana, text="Nombre del Cliente:").pack(pady=5)
entry_nombre = tk.Entry(ventana)
entry_nombre.pack(pady=5)

tk.Label(ventana, text="Presupuesto:").pack(pady=5)
entry_presupuesto = tk.Entry(ventana)
entry_presupuesto.pack(pady=5)

tk.Label(ventana, text="Tipo de Viaje:").pack(pady=5)
opciones_tipo_viaje = ["aventura", "cultura", "relajación", "gastronomía", "ecoturismo"]
tk.OptionMenu(ventana, tipo_viaje_var, *opciones_tipo_viaje).pack(pady=5)

tk.Label(ventana, text="Preferencia:").pack(pady=5)
opciones_preferencia = ["playa", "montaña", "ciudad", "selva", "desierto"]
tk.OptionMenu(ventana, preferencia_var, *opciones_preferencia).pack(pady=5)

# Botón para enviar los datos
tk.Button(ventana, text="Obtener Recomendación", command=enviar_datos).pack(pady=20)

# Ejecutar la aplicación
ventana.mainloop()

