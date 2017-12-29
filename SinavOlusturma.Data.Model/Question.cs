using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SinavOlusturma.Data.Model
{
    public class Question
    {
        public Guid Id { get; set; }
        public int ExamID { get; set; }
        public string QuestionContent { get; set; }
        public string OptionA { get; set; }
        public string OptionB { get; set; }
        public string OptionC { get; set; }
        public string OptionD { get; set; }
        public string Answer { get; set; }

        public virtual Exam Exam { get; set; }
    }
}
