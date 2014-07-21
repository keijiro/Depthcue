import UnityEngine

class SeparatorOverlay(MonoBehaviour):
    public separator as Texture
    public mask as Texture

    material as Material

    def Awake():
        material = Material(Shader.Find("Hidden/Separator Overlay"))
        material.SetTexture("_SeparatorTex", separator)
        material.SetTexture("_MaskTex", mask)

    def OnRenderImage(source as RenderTexture, destination as RenderTexture):
        Graphics.Blit(source, destination, material)
