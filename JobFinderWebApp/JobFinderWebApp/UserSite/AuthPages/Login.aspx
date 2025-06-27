<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite/AuthPages/AuthPages.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobFinderWebApp.UserSite.AuthPages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .password-toggle {
            transition: all 0.2s ease;
        }
        .password-toggle:hover {
            color: #4f46e5 !important;
            transform: scale(1.1);
        }
    </style>
    <script>
        function togglePassword(fieldId, toggleId) {
            const field = document.getElementById(fieldId);
            const toggle = document.getElementById(toggleId);
            
            if (field.type === "password") {
                field.type = "text";
                toggle.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                field.type = "password";
                toggle.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-h-screen bg-gradient-to-b from-indigo-50 to-white flex items-center justify-center p-4">
        <div class="w-full max-w-md">
            <!-- Logo & Header -->
            <div class="text-center mb-8">
                <div class="mx-auto h-16 w-16 bg-indigo-600 rounded-full flex items-center justify-center shadow-lg">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                    </svg>
                </div>
                <h1 class="mt-4 text-2xl font-bold text-gray-900">Sign in to your account</h1>
                <p class="mt-2 text-sm text-gray-600">
                    Or <a href="Register.aspx" class="font-medium text-indigo-600 hover:text-indigo-500">create a new account</a>
                </p>
            </div>

            <!-- Main Card -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden border border-gray-100">
                <div class="p-6 sm:p-8">
                    <div class="space-y-6" runat="server">
                        <div>
                            <label for="txtEmail" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                                        <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                                        <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                                    </svg>
                                </div>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                                    CssClass="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                    placeholder="you@example.com"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                ErrorMessage="Email is required" CssClass="mt-1 text-xs text-red-600" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                                ErrorMessage="Invalid email format" CssClass="mt-1 text-xs text-red-600" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <label for="txtPassword" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                                    </svg>
                                </div>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                    CssClass="block w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                    placeholder="••••••••"></asp:TextBox>
                                <button type="button" class="absolute inset-y-0 right-0 pr-3 flex items-center"
                                    onclick="togglePassword('<%= txtPassword.ClientID %>', 'togglePassword')">
                                    <i id="togglePassword" class="fas fa-eye text-gray-400 password-toggle"></i>
                                </button>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                                ErrorMessage="Password is required" CssClass="mt-1 text-xs text-red-600" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="flex items-center justify-between">
                            <div class="flex items-center">
                                <asp:CheckBox ID="chkRememberMe" runat="server"
                                    CssClass="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded" />
                                <label for="chkRememberMe" class="ml-2 block text-sm text-gray-900">
                                    Remember me
                                </label>
                            </div>

                            <div class="text-sm">
                                <a href="ForgotPassword.aspx" class="font-medium text-indigo-600 hover:text-indigo-500">
                                    Forgot password?
                                </a>
                            </div>
                        </div>

                        <div>
                            <asp:Button ID="btnLogin" runat="server" Text="Sign in" OnClick="btnLogin_Click"
                                CssClass="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors duration-200" />
                        </div>

                        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="mt-6">
                            <div class="rounded-lg bg-red-50 p-4">
                                <div class="flex">
                                    <div class="flex-shrink-0">
                                        <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                        </svg>
                                    </div>
                                    <div class="ml-3">
                                        <p class="text-sm font-medium text-red-800">
                                            <asp:Literal ID="litErrorMessage" runat="server"></asp:Literal>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="px-6 py-4 bg-gray-50 border-t border-gray-200">
                    <div class="text-sm text-center text-gray-600">
                        New to our platform? <a href="Register.aspx" class="font-medium text-indigo-600 hover:text-indigo-500">Sign up now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</asp:Content>
