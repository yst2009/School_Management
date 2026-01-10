<?php
namespace App\Livewire;

use App\Models\Degree;
use App\Models\Question;
use Livewire\Component;

class ShowQuestion extends Component
{
    public $quizze_id;
    public $student_id;
    public $data = [];
    public $counter = 0;
    public $questioncount = 0;
    public $student_answer = '';

    public function mount($quizze_id, $student_id)
    {
        $this->quizze_id = $quizze_id;
        $this->student_id = $student_id;
        $this->data = Question::where('quizze_id', $this->quizze_id)->get();
        $this->questioncount = count($this->data);
    }

    public function submitAnswer()
    {
         $question = $this->data[$this->counter];
         $right_answer = $question->right_answer;

         $stuDegree = Degree::where('student_id', $this->student_id)
             ->where('quizze_id', $this->quizze_id)
             ->first();

         if ($stuDegree == null) {
             $degree = new Degree();
             $degree->quizze_id = $this->quizze_id;
             $degree->student_id = $this->student_id;
             $degree->question_id = $question->id;
             $degree->score = 0;
             if (strcmp(trim($this->student_answer), trim($right_answer)) === 0) {
                 $degree->score += $question->score;
             }
             $degree->abuse = '0';
             $degree->date = date('Y-m-d');
             $degree->save();
         } else {
            
             if ($stuDegree->question_id >= $question->id) {
                 $stuDegree->score = 0;
                 $stuDegree->abuse = '1';
                 $stuDegree->save();
                 toastr()->error('تم إلغاء الاختبار لإكتشاف تلاعب بالنظام');
                 return redirect()->route('student_exams.index');
             }
             $stuDegree->question_id = $question->id;
             if (strcmp(trim($this->student_answer), trim($right_answer)) === 0) {
                 $stuDegree->score += $question->score;
             }
             $stuDegree->save();
         }

         if ($this->counter < $this->questioncount - 1) {
             $this->counter++;
             $this->student_answer = '';
         } else {
             toastr()->success('تم إجراء الاختبار بنجاح');
             return redirect()->route('student_exams.index');
         }
    }

    public function render()
    {
        return view('livewire.show-question');
    }
}
