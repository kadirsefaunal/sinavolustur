using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Data.Model
{
    public class Result
    {
        public Guid Id { get; set; }
        public int UserID { get; set; }
        public int ExamId { get; set; }
        public int NumberOfTrue { get; set; }

        public virtual User User { get; set; }
        public virtual Exam Exam { get; set; }
    }
}
