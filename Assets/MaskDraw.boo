import UnityEngine

class MaskDraw(MonoBehaviour):
    def Awake():
        camera.SetReplacementShader(Shader.Find("Hidden/Mask Draw"), null)
