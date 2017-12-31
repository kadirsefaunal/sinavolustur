using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Data.ModelView
{
    public class ExamQuestionView
    {
        public Exam Exam { get; set; }
        public List<Question> Questions { get; set; }
    }
}
