using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class BodyPartClickHandler : MonoBehaviour {
    public GameObject bottomPanel;
    public TMP_Text titleText;
    public TMP_Text descriptionText;

    void Start () {
        HideDetails();
    }

    public void HideDetails () {
        bottomPanel.SetActive(false);
    }

    void Update() {
        // if (Input.GetMouseButtonDown(0)) { // Detect left-click or tap
        //     RaycastHit hit;
        //     Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);

        //     if (Physics.Raycast(ray, out hit)) {
        //         ColliderData partInfo = hit.collider.GetComponent<ColliderData>();

        //         if (partInfo != null) {
        //             ShowDetails(partInfo);
        //         }
        //     }
        // }
    }

    void ShowDetails(ColliderData partInfo) {
        titleText.text = partInfo.title;
        descriptionText.text = partInfo.description;
        bottomPanel.SetActive(true); // Show the bottom panel
    }
}
