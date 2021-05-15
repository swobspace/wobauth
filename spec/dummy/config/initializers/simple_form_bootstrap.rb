# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  # config.button_class = 'btn btn-primary'
  config.boolean_label_class = 'form-check-label'

  # Helpers
  wrapper_options = {class: 'mb-3'}
  input_options = {error_class: 'is-invalid'}
  label_class = 'col-form-label'

  error_and_hint = ->(b) do
    b.use :error, wrap_with: {tag: 'span', class: 'invalid-feedback'}
    b.use :hint,  wrap_with: {tag: 'small', class: 'form-text text-muted'}
  end

  config.wrappers :vertical_form, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input, class: 'form-control'
    error_and_hint.call(b)
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input
    error_and_hint.call(b)
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    error_and_hint.call(b)
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'control-label'
    b.use :input
    error_and_hint.call(b)
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'mb-3 row', error_class: 'has-invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'col-sm-3 col-md-2 col-form-label'

    b.wrapper tag: 'div', class: 'col-sm-9 col-md-10' do |ba|
      ba.use :input, class: 'form-control'
      error_and_hint.call(ba)
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: 'col-sm-3 col-md-2 col-form-label'

    b.wrapper tag: 'div', class: 'col-sm-9 col-md-10' do |ba|
      ba.use :input
      error_and_hint.call(ba)
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'col-sm-3 col-md-2 col-form-label'

    b.wrapper tag: 'div', class: 'offset-sm-3 col-sm-9 offset-md-2 col-md-10' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input
      end
      error_and_hint.call(wr)
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-3 col-md-2 col-form-label'

    b.wrapper tag: 'div', class: 'col-sm-9 col-md-10' do |ba|
      ba.use :input
      error_and_hint.call(b)
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'

    b.use :input, class: 'form-control'
    error_and_hint.call(b)
  end

  config.wrappers :multi_select, tag: 'div', class: 'mb-3', error_class: 'has-invalid' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'control-label'
    b.wrapper tag: 'div', class: 'form-inline' do |ba|
      ba.use :input, class: 'form-control'
      error_and_hint.call(ba)
    end
  end
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :horizontal_form
  config.wrapper_mappings = {
    check_boxes: :horizontal_radio_and_checkboxes,
    radio_buttons: :horizontal_radio_and_checkboxes,
    file: :horizontal_file_input,
    boolean: :horizontal_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
end
