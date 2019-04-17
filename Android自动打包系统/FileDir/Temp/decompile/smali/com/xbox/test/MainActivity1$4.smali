.class Lcom/xbox/test/MainActivity1$4;
.super Ljava/lang/Object;
.source "MainActivity1.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xbox/test/MainActivity1;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xbox/test/MainActivity1;


# direct methods
.method constructor <init>(Lcom/xbox/test/MainActivity1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/xbox/test/MainActivity1$4;->this$0:Lcom/xbox/test/MainActivity1;

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/xbox/test/MainActivity1$4;->this$0:Lcom/xbox/test/MainActivity1;

    invoke-virtual {v0}, Lcom/xbox/test/MainActivity1;->exit()V

    .line 172
    return-void
.end method
