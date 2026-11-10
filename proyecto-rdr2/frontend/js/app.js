const tabla = document.getElementById('tabla');
const filtroNombre = document.getElementById('filtroNombre');
const filtroStock = document.getElementById('filtroStock');
const contador = document.getElementById('contador');
const mensaje = document.getElementById('mensaje');

let objetos = [];

// Crea una celda de texto (textContent evita inyectar HTML)
function celda(texto, clase) {
  const td = document.createElement('td');
  td.textContent = texto;
  if (clase) td.className = clase;
  return td;
}

// Dibuja la tabla con la lista recibida
function render(lista) {
  tabla.replaceChildren();

  lista.forEach(o => {
    const fila = document.createElement('tr');
    fila.append(
      celda(o.id),
      celda(o.nombre),
      celda(o.stock, o.stock === 0 ? 'sin-stock' : ''),
      celda(o.tienda ?? '—')
    );
    tabla.append(fila);
  });

  contador.textContent = `Mostrando ${lista.length} de ${objetos.length} objetos`;
}

// Aplica los dos filtros a la vez (nombre + disponibilidad)
function filtrar() {
  const texto = filtroNombre.value.trim().toLowerCase();
  const estado = filtroStock.value;

  const resultado = objetos.filter(o => {
    const coincideNombre = o.nombre.toLowerCase().includes(texto);
    const coincideStock =
      estado === 'todos' ||
      (estado === 'con' && o.stock > 0) ||
      (estado === 'sin' && o.stock === 0);
    return coincideNombre && coincideStock;
  });

  render(resultado);
}

async function cargarObjetos() {
  try {
    const respuesta = await fetch('http://localhost:3000/api/objetos');
    if (!respuesta.ok) throw new Error('Error HTTP ' + respuesta.status);
    objetos = await respuesta.json();
    render(objetos);
  } catch (error) {
    mensaje.textContent = 'No se pudieron cargar los datos: ' + error.message;
    mensaje.classList.remove('d-none');
  }
}

filtroNombre.addEventListener('input', filtrar);
filtroStock.addEventListener('change', filtrar);
cargarObjetos();
