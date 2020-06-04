using Business;
using CModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api_Neta.Controllers
{
    [RoutePrefix("api/Contacto")]
    public class ContactoController : ApiController
    {
        CAD_Contact MTD = new CAD_Contact();

        [HttpGet]
        public IHttpActionResult Valida()
        {
            return Ok("En linea");
        }

        [HttpGet]
        [Route("GetContactos")]
        public IHttpActionResult GetContactos()
        {
            var Contactos = MTD.GetContacts();
            return Ok(Contactos);
        }

        [HttpGet]
        [Route("SearchContact")]
        public IHttpActionResult SearchContact(string Name)
        {
            var Contacto = MTD.SearchContact(Name);
            return Ok(Contacto);
        }

        [HttpPost]
        [Route("SaveContact")]
        public IHttpActionResult SaveContact(Contact Model, int Accion)
        {
            var Contacto = MTD.Crud_Contact(Model, Accion);
            return Ok(Contacto);
        }

    }
}