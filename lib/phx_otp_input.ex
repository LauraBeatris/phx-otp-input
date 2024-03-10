defmodule PhxOtpInput do
  use Phoenix.Component

  alias PhxOtpInput.Component

  @moduledoc ~S"""
  The `PhxOtpInput` component is rendered by calling the `otp_input/1` function and passing it a form field.
  """

  attr :field, :any,
    required: true,
    doc: "a Phoenix.HTML.FormField struct identifying the form's field"

  attr :id, :string,
    doc:
      ~S(an id to assign to the component. If none is provided, `#{form_name}_#{field}_otp_input_component` will be used)

  def otp_input(assigns) do
    assigns =
      assigns
      |> update(:field, fn
        %Phoenix.HTML.FormField{} = field, _ ->
          field

        field, %{form: form} ->
          IO.warn(
            "instead of passing separate form and field attributes, pass a single field attribute of type Phoenix.HTML.FormField"
          )

          to_form(form)[field]

        _, _ ->
          raise "if you pass field as atom or string, you also have to pass a form"
      end)
      |> assign_new(:id, fn %{field: field} ->
        "#{field.form.name}_#{field.field}_otp_input_component"
      end)
      |> assign(module: PhxOtpInput.Component)

    ~H"""
    <.live_component {assigns} />
    """
  end
end
