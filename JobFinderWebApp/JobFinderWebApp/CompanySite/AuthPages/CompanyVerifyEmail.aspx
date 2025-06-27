<%@ Page Title="" Language="C#" MasterPageFile="~/CompanySite/AuthPages/AuthPages.Master" AutoEventWireup="true" CodeBehind="CompanyVerifyEmail.aspx.cs" Inherits="JobFinderWebApp.CompanySite.AuthPages.CompanyVerifyEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
        <div class="sm:mx-auto sm:w-full sm:max-w-md">
            <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">Verify Your Email</h2>
            <p class="mt-2 text-center text-sm text-gray-600">
                We've sent a verification code to your company email address
            </p>
        </div>

        <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
            <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
                <div class="space-y-6">
                    <div>
                        <label for="txtVerificationCode" class="block text-sm font-medium text-gray-700">
                            Verification Code
                        </label>
                        <div class="mt-1">
                            <asp:TextBox ID="txtVerificationCode" runat="server" 
                                CssClass="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                MaxLength="6"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCode" runat="server"
                                ControlToValidate="txtVerificationCode" ErrorMessage="Verification code is required"
                                CssClass="text-red-600 text-xs" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnVerify" runat="server" Text="Verify" OnClick="btnVerify_Click"
                            CssClass="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" />
                    </div>

                    <div class="text-center text-sm">
                        <asp:LinkButton ID="btnResendCode" runat="server" OnClick="btnResendCode_Click"
                            CssClass="font-medium text-indigo-600 hover:text-indigo-500">
                            Resend Verification Code
                        </asp:LinkButton>
                    </div>

                    <asp:Panel ID="pnlError" runat="server" Visible="false"
                        CssClass="bg-red-50 border-l-4 border-red-400 p-4">
                        <div class="flex">
                            <div class="flex-shrink-0">
                                <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                    fill="currentColor">
                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                </svg>
                            </div>
                            <div class="ml-3">
                                <p class="text-sm text-red-700">
                                    <asp:Literal ID="litErrorMessage" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>