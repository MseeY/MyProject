.class Lcom/xbox/sdk/XSDK$1;
.super Ljava/lang/Object;
.source "XSDK.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xbox/sdk/XSDK;->showProgressDialog(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/sdk/XSDK;


# direct methods
.method constructor <init>(Lcom/xbox/sdk/XSDK;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/xbox/sdk/XSDK$1;->this$0:Lcom/xbox/sdk/XSDK;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "paramAnonymousDialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 69
    return-void
.end method
