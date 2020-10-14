<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="call back.aspx.cs" Inherits="WebApplication2.call_back" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="sc-wrapper sc-wrapper--with-padding footer-form-wrapper">
    <div class="sm-container">

        <hgroup class="heading-group">
            
            <h1>CALLBACK</h1>
            
            <h2>REQUEST A CALLBACK</h2>
        </hgroup>

        <div class="footer-form js-form-body">

<form action="http://www.aircharterservice.co.in/call-back/process" class="call-back-form" id="call-back-form" method="post"><input name="__RequestVerificationToken" type="hidden" value="CQwZ1_EwlvhezM06GisbZB4wY7FPkf_fMrZ6ycxlPy0XcudFoOX5Upxj45csZvX08VC20k2xPNF0sEhRwsDNf3ZkgcU1" />                    <div class="row">
                        <div class="col lg_span_6 md_span_6 sm_span_6">
                            <fieldset>
                                <div class="footer-form__input-wrapper">
                                    <label class="" for="Name">NAME</label>
                                    <input data-val="true" data-val-length="[Invalid_Name] not found" data-val-length-max="255" data-val-length-min="1" data-val-required="Please enter your name" id="Name" name="Name" type="text" value="" />
                                </div>
                                <div class="footer-form__input-wrapper">
                                    <label class="" for="DirectNumber">DIRECT NUMBER (please include your country code)</label>
                                    <input data-val="true" data-val-required="Please enter your direct number" id="DirectNumber" name="DirectNumber" type="tel" value="" />
                                </div>
                                <div class="footer-form__input-wrapper">
                                    <label class="" for="Email">EMAIL ADDRESS</label>
                                    <input data-val="true" data-val-regex="Please enter a valid email address" data-val-regex-pattern="^[\S^@]+@[\S^@]+\.[\S^@]+$" data-val-required="Please enter your email address" id="Email" name="Email" type="email" value="" />
                                </div>
                            </fieldset>
                        </div>

                        <div class="col lg_span_6 md_span_6 sm_span_6">
                            <fieldset>
                              
                                <div class="footer-form__input-wrapper">
                                    <label class="" for="AdditionalComments">ADDITIONAL COMMENTS</label>
                                    <textarea cols="20" id="AdditionalComments" name="AdditionalComments" rows="4">
</textarea>
                                </div>
                            </fieldset>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col lg_span_6 md_span_6 sm_span_6">
                            <input id="PageId" name="PageId" type="hidden" value="tcm:50-1323-64" />
                            <div class="validation-summary-valid" data-valmsg-summary="true"><span>Please complete the highlighted fields</span>
<ul><li style="display:none"></li>
</ul></div>
                        </div>
                    </div>
                    <div class="footer-form-step__actions">
                        <button type="submit" class="blue-split-cta">CALL ME BACK</button>
                    </div>
</form>
        </div>

</div>
</section>


</asp:Content>
