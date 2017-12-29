using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Data.Model
{
    public class User
    {
        public User()
        {
            this.Results = new List<Result>();
        }

        public Guid Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool Role { get; set; }

        public virtual ICollection<Result> Results { get; set; }
    }
}

