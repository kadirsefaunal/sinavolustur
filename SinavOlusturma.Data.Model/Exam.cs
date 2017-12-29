using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Data.Model
{
    public class Exam
    {
        public Exam()
        {
            this.Questions = new List<Question>();
        }

        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public DateTime Date { get; set; }

        public virtual ICollection<Question> Questions { get; set; }
    }
}
