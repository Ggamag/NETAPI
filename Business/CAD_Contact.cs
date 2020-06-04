using CAD;
using CModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    
    public  class CAD_Contact
    {
       BDContactEntities db = new BDContactEntities();

        public int Crud_Contact(Contact _Mod, int Accion)
        {
            var Result = db.Database.ExecuteSqlCommand("SP_CRUD_CONTACT @ACTION, @ID, @NAME, @PHONE, @MAIL, @FECHA",
                                                        new SqlParameter("@ACTION", Accion),
                                                        new SqlParameter("@ID", _Mod.IdPersona),
                                                        new SqlParameter("@NAME", _Mod.Nombre),
                                                        new SqlParameter("@PHONE", _Mod.Telefono),
                                                        new SqlParameter("@MAIL", _Mod.Email),
                                                        new SqlParameter("@FECHA", _Mod.FechaNacimiento));
            return Result;
        }

        public List<Contact> GetContacts()
        {
            var Lista = db.Database.SqlQuery<Contact>("SP_GET_CONTACTOS").ToList();
            return Lista;
        }

        public List<Contact> SearchContact(string Name)
        {
            var Lista = db.Database.SqlQuery<Contact>("SP_SEARCH_CONTACTO @NAME", new SqlParameter("@NAME", Name)).ToList();
            return Lista;
        }

    }
}
