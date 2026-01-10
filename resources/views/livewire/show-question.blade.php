<div>
    @if($questioncount > 0)
        <div class="card card-statistics mb-30">
            <div class="card-body">
                <h5 class="card-title">({{ $counter + 1 }}/{{$questioncount}}) {{ $data[$counter]->title }}</h5>
                <div class="mt-3">
                    @foreach(preg_split('/(-)/', $data[$counter]->answers) as $index => $answer)
                        @if(!empty(trim($answer)))
                            <div class="custom-control custom-radio">
                                <input type="radio" id="radio{{$index}}" name="radio_questions" value="{{$answer}}" class="custom-control-input" wire:model="student_answer">
                                <label class="custom-control-label" for="radio{{$index}}">{{ $answer }}</label>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
        <button class="btn btn-primary" wire:click="submitAnswer">
            @if($counter < $questioncount - 1)
                السؤال التالي
            @else
                إنهاء الاختبار
            @endif
        </button>
    @else
        <div class="alert alert-danger">لا توجد أسئلة في هذا الاختبار.</div>
    @endif
</div>
