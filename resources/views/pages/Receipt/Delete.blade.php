<!-- Deleted inFormation Student -->
<div class="modal fade" id="Delete_receipt{{$receipt_student->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="font-family: 'Cairo', sans-serif;" class="modal-title" id="exampleModalLabel">{{trans('receipt_trans.delete_receipt')}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{route('receipt_students.destroy','test')}}" method="post">
                    @csrf
                    @method('DELETE')
                    <input type="hidden" name="id" value="{{$receipt_student->id}}">
                    <h5 style="font-family: 'Cairo', sans-serif;">{{trans('receipt_trans.delete_confirm')}}</h5>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('receipt_trans.close')}}</button>
                        <button  class="btn btn-danger">{{trans('receipt_trans.submit')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
