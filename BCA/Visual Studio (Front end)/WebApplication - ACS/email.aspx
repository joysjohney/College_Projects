<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="WebApplication2.email" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="sc-wrapper sc-wrapper--with-padding footer-form-wrapper">
    <div class="sm-container">

        <hgroup class="heading-group">
            
            <h1>EMAIL US</h1>
            
           
        </hgroup>

        <div class="footer-form js-form-body">

<form action="http://www.aircharterservice.co.in/contact-us/process" class="call-back-form" method="post"><input name="__RequestVerificationToken" type="hidden" value="wCS9dR1B3GFYe418muxsSovsC0oD7A7ycahJoa1I8l2jAvjMP5g2iTdIczCgDIEZ7xmNFyp1n_y2ztKqbpEM5zqtx-k1" />                    <div class="row">
                        <div class="col lg_span_6 md_span_6 sm_span_6">
                            <fieldset>
                                <div class="footer-form__input-wrapper">
                                    <label class="" for="Name">NAME</label>
                                    <input data-val="true" data-val-length="[Invalid_Name] not found" data-val-length-max="255" data-val-length-min="1" data-val-required="Please enter your name" id="Name" name="Name" type="text" value="" />
                                </div>
                                <div class="footer-form__input-wrapper">
                                    <label class="" for="Email">EMAIL ADDRESS</label>
                                    <input data-val="true" data-val-regex="Please enter a valid email address" data-val-regex-pattern="^[\S^@]+@[\S^@]+\.[\S^@]+$" data-val-required="Please enter your email address" id="Email" name="Email" type="email" value="" />
                                </div>
                                <div class="footer-form__input-wrapper">
                                    <label class="footer-form__label" for="InquiryType">Enquiry Type*</label>
                                    <select data-val="true" data-val-required="[Required_EnquiryType] not found" id="EnquiryType" name="EnquiryType"><option value="Private">Private</option>

<option value="Office">Office</option>
</select>
                                </div>
                            </fieldset>
                        </div>

                        <div class="col lg_span_6 md_span_6 sm_span_6">
                            <fieldset>
                 
                               
                                <div class="footer-form__input-wrapper">
                                    <label for="AdditionalComments">YOUR MESSAGE</label>
                                    <textarea cols="20" id="AdditionalComments" name="AdditionalComments" rows="4">
</textarea>
                                </div>
                            </fieldset>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col lg_span_6 md_span_6 sm_span_6">
                            <input id="PageId" name="PageId" type="hidden" value="tcm:50-36955-64" />
                            <div class="validation-summary-valid" data-valmsg-summary="true"><span>Please complete the highlighted fields</span>
<ul><li style="display:none"></li>
</ul></div>
                        </div>
                    </div>
                    <div class="footer-form-step__actions">
                        <button type="submit" class="blue-split-cta">EMAIL US</button>
                    </div>
</form>
        </div>

    </div>
</section>

</asp:Content>
